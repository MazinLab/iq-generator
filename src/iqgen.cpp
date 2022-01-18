#include "iqgen.hpp"

void iq_gen(hls::stream<iqstream_t> &out, unsigned int max) {

#pragma HLS INTERFACE axis port=out register_mode=both register
#pragma HLS INTERFACE s_axilite port=max bundle=control
#pragma HLS INTERFACE ap_ctrl_none port=return bundle=control

	outloop: for (unsigned int i=0; i<max;i+=2) {
#pragma HLS PIPELINE II=2 REWIND
		iqstream_t tmp;
		for (int j=0; j<8; j++)
			tmp.data.range((j+1)*32-1,j*32)=i*8+j;
		tmp.user=i&255;
		tmp.last=tmp.user==255;
		out.write(tmp);
		for (int j=0; j<8; j++)
			tmp.data.range((j+1)*32-1, j*32)=(i+1)*8+j;
		tmp.user=(i+1)&255;
		tmp.last=tmp.user==255;
		out.write(tmp);
	}
}
