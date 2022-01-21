// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xiq_gen.h"

extern XIq_gen_Config XIq_gen_ConfigTable[];

XIq_gen_Config *XIq_gen_LookupConfig(u16 DeviceId) {
	XIq_gen_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XIQ_GEN_NUM_INSTANCES; Index++) {
		if (XIq_gen_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XIq_gen_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XIq_gen_Initialize(XIq_gen *InstancePtr, u16 DeviceId) {
	XIq_gen_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XIq_gen_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XIq_gen_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

