
#include "iqgen.hpp"
#include <iostream>
using namespace std;

int main() {

	bool fail=false;


	unsigned int max=256*100;
	hls::stream<iqstream_t> out;
	iq_gen(out, max);

	for (int i=0;i<max; i++) {
		iqstream_t d=out.read();
		for (int j=0; j<8; j++) {
			fail|=(d.data.range((j+1)*32-1,j*32).to_uint()!=i*8+j);
			if (fail) {
				cout<<"failed, i,j="<<i<<","<<j<<endl;
				break;
			}
		}
		if (fail) break;

		fail|= d.last!=(i%256 == 255);
		if (fail) {
			cout<<"last error"<<endl;
			break;
		}

		fail|= d.user!=i%256;
		if (fail) {
			cout<<"user error"<<endl;
			break;
		}
	}
	fail|=!out.empty();
	if (!out.empty()) cout<<"not empty error"<<endl;


	return fail;
}
