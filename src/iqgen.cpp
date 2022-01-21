#include "iqgen.hpp"
//core restarts but has 4 clocks of idle
void iq_gen_noiq(hls::stream<iqstream_t> &out, ap_uint<27> max) {
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=out register_mode=both register
#pragma HLS INTERFACE s_axilite port=max

	outloop: for (unsigned int i=0; i<max;i+=2) {
#pragma HLS PIPELINE II=2 REWIND
		iqstream_t tmp;

		for (int k=0; k<8; k++) tmp.data.range((k+1)*32-1,k*32)=i*8+k;
		tmp.user=(i&255);
		tmp.last=false;
		out.write(tmp);

		for (int k=0; k<8; k++) tmp.data.range((k+1)*32-1,k*32)=(i+1)*8+k;
		tmp.user=((i+1)&255);
		tmp.last=tmp.user==255;
		out.write(tmp);
	}
}

void iq_gen(hls::stream<iqstream_t> &out, hls::stream<istream_t> &i_out, hls::stream<istream_t> &q_out, ap_uint<27> max) {
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=out register_mode=both register
#pragma HLS INTERFACE axis port=i_out register_mode=both register
#pragma HLS INTERFACE axis port=q_out register_mode=both register
#pragma HLS INTERFACE s_axilite port=max

	outloop: for (unsigned int i=0; i<max;i+=2) {
#pragma HLS PIPELINE II=2 REWIND
		iqstream_t tmp;
		istream_t tmp2;

		for (int k=0; k<8; k++) tmp.data.range((k+1)*32-1,k*32)=i*8+k;
		tmp.user=(i&255);
		tmp.last=false;
		out.write(tmp);

		for (int k=0; k<8; k++) tmp2.data.range((k+1)*16-1,k*16)=tmp.data.range((k+1)*32-1-16,k*32);
		tmp2.last=false;
		i_out.write(tmp2);
		q_out.write(tmp2);

		for (int k=0; k<8; k++) tmp.data.range((k+1)*32-1,k*32)=(i+1)*8+k;
		tmp.user=((i+1)&255);
		tmp.last=tmp.user==255;
		out.write(tmp);

		for (int k=0; k<8; k++) tmp2.data.range((k+1)*16-1,k*16)=tmp.data.range((k+1)*32-1-16,k*32);
		tmp2.last=tmp.last;
		i_out.write(tmp2);
		q_out.write(tmp2);
	}
}
