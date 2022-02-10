
#include "iqgen.hpp"
#include <iostream>
using namespace std;

int main() {

	bool fail=false;


	unsigned int max=256*4;
	hls::stream<iqstream_t> out;
	hls::stream<istream_t> i_out, q_out;
	hls::stream<pstream_t> phase;
	iq_gen(out, i_out, q_out, phase, max);

	// iq: 8 32 bit ints  0...7 8...15 ... up to 2^32-1 or max*8-1 last every 256th group user 0-255
	// i & q: 8 16 bit ints  0...7 8...15 ... up to 2^16-1 or max*8-1 last every 256th group user 0-255
	// phase: 4 16 bit ints  0...3 4...7 ... up to 2^16-1 or max*4-1 last every 512th group user 0-511


	for (int i=0;i<max; i++) {
		iqstream_t d=out.read();
		istream_t di=i_out.read();
		istream_t dq=q_out.read();
		pstream_t dp=phase.read();

		for (int j=0; j<8; j++) {
			fail|=(d.data.range((j+1)*32-1,j*32).to_uint()!=i*8+j);
			if (fail) {
				cout<<"failed, i,j="<<i<<","<<j<<endl;
				break;
			} else if (j==0) cout<<d.data.range((j+1)*32-1,j*32).to_uint()<<endl;
		}
		if (fail) break;

		for (int j=0; j<8; j++) {
			fail|=(di.data.range((j+1)*16-1,j*16).to_uint()!=i*8+j);
			if (fail) {
				cout<<"failed,i&q i,j="<<i<<","<<j<<endl;
				break;
			} else if (j==0) cout<<d.data.range((j+1)*16-1,j*16).to_uint()<<endl;
		}
		if (fail) break;

		for (int j=0; j<4; j++) {
			fail|=(dp.data.range((j+1)*16-1,j*16).to_uint()!=i);//*4+j);
			if (fail) {
				cout<<"failed, phase i,j="<<i<<","<<j<<endl;
				break;
			} else if (j==0) cout<<dp.data.range((j+1)*16-1,j*16).to_uint()<<endl;
		}
		if (fail) break;


		fail|= di.data!=dq.data || di.user!=dq.user || di.last!=dq.last;
		if (fail) break;

		fail|= d.last!=(i%256 == 255);
		if (fail) {
			cout<<"last error"<<endl;
			break;
		}
		fail|= di.last!=(i%256 == 255);
		if (fail) {
			cout<<"i&q last error"<<endl;
			break;
		}
		fail|= dp.last!=(i%512 == 511);
		if (fail) {
			cout<<"phase last error"<<endl;
			break;
		}

		fail|= d.user!=i%256;
		if (fail) {
			cout<<"user error"<<endl;
			break;
		}
//		fail|= di.user!=i%256;
//		if (fail) {
//			cout<<"i&q user error"<<d.user<<" "<<di.user<<" "<<dq.user<<endl;
//			break;
//		}
		fail|= dp.user!=i%512;
		if (fail) {
			cout<<"phase user error"<<endl;
			break;
		}
	}

	fail|=!out.empty();
	if (!out.empty()) cout<<"not empty error"<<endl;


	return fail;
}
