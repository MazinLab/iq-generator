#include "iqgen.hpp"

void iq_gen(hls::stream<iqstream_t> &out, ap_uint<27> max) {
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
