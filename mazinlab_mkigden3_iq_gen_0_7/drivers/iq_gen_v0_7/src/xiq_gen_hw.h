// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of max
//        bit 26~0 - max[26:0] (Read/Write)
//        others   - reserved
// 0x14 : reserved
// 0x18 : Data signal of run
//        bit 0  - run[0] (Read/Write)
//        others - reserved
// 0x1c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XIQ_GEN_CONTROL_ADDR_MAX_DATA 0x10
#define XIQ_GEN_CONTROL_BITS_MAX_DATA 27
#define XIQ_GEN_CONTROL_ADDR_RUN_DATA 0x18
#define XIQ_GEN_CONTROL_BITS_RUN_DATA 1

