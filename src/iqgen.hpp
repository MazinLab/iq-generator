#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_stream.h"
#include <ap_utils.h>
typedef ap_axiu<256,8,0,0> iqstream_t;

void iq_gen(hls::stream<iqstream_t> &out, unsigned int max);
