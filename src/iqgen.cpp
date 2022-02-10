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

void iq_gen_nophase(hls::stream<iqstream_t> &out, hls::stream<istream_t> &i_out, hls::stream<istream_t> &q_out, ap_uint<27> max) {
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

// iq: 8 32 bit ints  0...7 8...15 ... up to 2^32-1 or max*8-1 last every 256th group user 0-255
// i & q: 8 16 bit ints  0...7 8...15 ... up to 2^16-1 or max*8-1 last every 256th group user 0-255
// phase: 4 16 bit ints  0...3 4...7 ... up to 2^16-1 or max*4-1 last every 512th group user 0-511
void iq_gen(hls::stream<iqstream_t> &out, hls::stream<istream_t> &i_out, hls::stream<istream_t> &q_out, hls::stream<pstream_t> &phase, ap_uint<27> max) {
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=out register_mode=both register
#pragma HLS INTERFACE axis port=i_out register_mode=both register
#pragma HLS INTERFACE axis port=q_out register_mode=both register
#pragma HLS INTERFACE axis port=phase register_mode=both register
#pragma HLS INTERFACE s_axilite port=max

	outloop: for (unsigned int i=0; i<max;i+=2) {
#pragma HLS PIPELINE II=2 REWIND
		iqstream_t tmp;
		istream_t tmp2;
		pstream_t ptmp;

		for (int k=0; k<8; k++) tmp.data.range((k+1)*32-1,k*32)=i*8+k;
		tmp.user=(i&255);
		tmp.last=false;

		for (int k=0; k<4; k++) ptmp.data.range((k+1)*16-1,k*16)=i;//*4+k;
		ptmp.user=(i&511);
		ptmp.last=false;

		for (int k=0; k<8; k++) tmp2.data.range((k+1)*16-1,k*16)=tmp.data.range((k+1)*32-1-16,k*32);
		tmp2.last=false;
//		tmp2.user=tmp.user;

		out.write(tmp);
		i_out.write(tmp2);
		q_out.write(tmp2);
		phase.write(ptmp);

		for (int k=0; k<8; k++) tmp.data.range((k+1)*32-1,k*32)=(i+1)*8+k;
		tmp.user=((i+1)&255);
		tmp.last=tmp.user==255;

		for (int k=0; k<4; k++) ptmp.data.range((k+1)*16-1,k*16)=i+1;//(i+1)*4+k;
		ptmp.user=((i+1)&511);
		ptmp.last=ptmp.user==511;

		for (int k=0; k<8; k++) tmp2.data.range((k+1)*16-1,k*16)=tmp.data.range((k+1)*32-1-16,k*32);
		tmp2.last=tmp.last;
//		tmp2.user=tmp.user;

		out.write(tmp);
		i_out.write(tmp2);
		q_out.write(tmp2);
		phase.write(ptmp);
	}
}

