// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XIQ_GEN_H
#define XIQ_GEN_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xiq_gen_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XIq_gen_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XIq_gen;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XIq_gen_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XIq_gen_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XIq_gen_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XIq_gen_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XIq_gen_Initialize(XIq_gen *InstancePtr, u16 DeviceId);
XIq_gen_Config* XIq_gen_LookupConfig(u16 DeviceId);
int XIq_gen_CfgInitialize(XIq_gen *InstancePtr, XIq_gen_Config *ConfigPtr);
#else
int XIq_gen_Initialize(XIq_gen *InstancePtr, const char* InstanceName);
int XIq_gen_Release(XIq_gen *InstancePtr);
#endif


void XIq_gen_Set_max(XIq_gen *InstancePtr, u32 Data);
u32 XIq_gen_Get_max(XIq_gen *InstancePtr);
void XIq_gen_Set_run(XIq_gen *InstancePtr, u32 Data);
u32 XIq_gen_Get_run(XIq_gen *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
