#include "iqgen.hpp"
#include <assert.h>

inline void adder(ap_uint<27> &x, ap_uint<27> _max, bool even) {
//#pragma HLS PIPELINE II=1
		if (x<_max-1-even) x+=2;
		else x=even;
}

ap_uint<27> adder2(ap_uint<27> &xo, ap_uint<27> &xe, ap_uint<27> _max, bool odd) {
#pragma HLS PIPELINE II=1
	ap_uint<27> ret;
	ret=odd ? xo:xe;
	if (odd) {
		adder(xo, _max, 0);
	} else {
		adder(xe, _max, 1);
	}
	return ret;
}



// iq: 8 32 bit ints  0...7 8...15 ... up to 2^32-1 or max*8-1 last every 256th group user 0-255
// i & q: 8 16 bit ints  0...7 8...15 ... up to 2^16-1 or max*8-1 last every 256th group user 0-255
// phase: 4 16 bit ints  0...3 4...7 ... up to 2^16-1 or max*4-1 last every 512th group user 0-511
void iq_gen(hls::stream<iqstream_t> &out, hls::stream<istream_t> &i_out, hls::stream<istream_t> &q_out, hls::stream<pstream_t> &phase, ap_uint<20> max, volatile bool run) {
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=out register_mode=both register
#pragma HLS INTERFACE axis port=i_out register_mode=both register
#pragma HLS INTERFACE axis port=q_out register_mode=both register
#pragma HLS INTERFACE axis port=phase register_mode=both register
#pragma HLS INTERFACE s_axilite port=max
#pragma HLS INTERFACE s_axilite port=run

	bool _run=run;
	ap_uint<29> _max=max*512;
	ap_uint<29> i=0;
	outloop: while (_run) {
#pragma HLS LOOP_TRIPCOUNT min=512 max=536870912 //(2**29-1)
#pragma HLS PIPELINE II=1 REWIND
		iqstream_t tmp;
		istream_t tmp2;
		pstream_t ptmp;
		unsigned int cy=i.to_uint();
		unsigned int iq_user, phase_user;
		iq_user=cy&255;
		phase_user=cy&511;

		for (int k=0; k<8; k++) tmp.data.range((k+1)*32-1,k*32)=cy*8+k;
		tmp.user=iq_user;
		tmp.last=iq_user==255;

		for (int k=0; k<4; k++) ptmp.data.range((k+1)*16-1,k*16)=cy;//*4+k;
		ptmp.user=phase_user;
		ptmp.last=phase_user==511;

		for (int k=0; k<8; k++) tmp2.data.range((k+1)*16-1,k*16)=tmp.data.range((k+1)*32-1-16,k*32);
		tmp2.last=tmp.last;

		out.write(tmp);
		i_out.write(tmp2);
		q_out.write(tmp2);
		phase.write(ptmp);

		if (i==_max) i=0;
		else i++;
		if (ptmp.last) _run=run;
	}


}



