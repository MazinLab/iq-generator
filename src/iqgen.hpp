#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_stream.h"
#include <ap_utils.h>
typedef ap_axiu<256,8,0,0> iqstream_t;
typedef ap_axiu<128,0,0,0> istream_t;
typedef ap_axiu<64,16,0,0> pstream_t;

void iq_gen(hls::stream<iqstream_t> &out, ap_uint<27> max);
void iq_gen(hls::stream<iqstream_t> &out, hls::stream<istream_t> &iout, hls::stream<istream_t> &qout, ap_uint<27> max);
void iq_gen(hls::stream<iqstream_t> &out, hls::stream<istream_t> &iout, hls::stream<istream_t> &qout, hls::stream<pstream_t> &phase, ap_uint<27> max);


