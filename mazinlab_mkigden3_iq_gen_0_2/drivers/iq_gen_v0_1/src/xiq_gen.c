// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xiq_gen.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XIq_gen_CfgInitialize(XIq_gen *InstancePtr, XIq_gen_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XIq_gen_Set_max(XIq_gen *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XIq_gen_WriteReg(InstancePtr->Control_BaseAddress, XIQ_GEN_CONTROL_ADDR_MAX_DATA, Data);
}

u32 XIq_gen_Get_max(XIq_gen *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XIq_gen_ReadReg(InstancePtr->Control_BaseAddress, XIQ_GEN_CONTROL_ADDR_MAX_DATA);
    return Data;
}

