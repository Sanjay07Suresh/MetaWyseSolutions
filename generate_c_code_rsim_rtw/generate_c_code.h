/*
 * generate_c_code.h
 *
 * Code generation for model "generate_c_code".
 *
 * Model version              : 1.2
 * Simulink Coder version : 24.2 (R2024b) 21-Jun-2024
 * C source code generated on : Tue Dec 10 10:38:57 2024
 *
 * Target selection: rsim.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef generate_c_code_h_
#define generate_c_code_h_
#ifndef generate_c_code_COMMON_INCLUDES_
#define generate_c_code_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "rsim.h"
#include "rt_logging.h"
#include "rt_nonfinite.h"
#include "math.h"
#include "dt_info.h"
#endif                                 /* generate_c_code_COMMON_INCLUDES_ */

#include "generate_c_code_types.h"
#include "rt_defines.h"
#include <stddef.h>
#include <string.h>
#define MODEL_NAME                     generate_c_code
#define NSAMPLE_TIMES                  (2)                       /* Number of sample times */
#define NINPUTS                        (0)                       /* Number of model inputs */
#define NOUTPUTS                       (0)                       /* Number of model outputs */
#define NBLOCKIO                       (2)                       /* Number of data output port signals */
#define NUM_ZC_EVENTS                  (0)                       /* Number of zero-crossing events */
#ifndef NCSTATES
#define NCSTATES                       (0)                       /* Number of continuous states */
#elif NCSTATES != 0
# error Invalid specification of NCSTATES defined in compiler command
#endif

#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm)         (NULL)
#endif

#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val)
#endif

/* Block signals (default storage) */
typedef struct {
  boolean_T RelationalOperator;        /* '<Root>/Relational Operator' */
  boolean_T RelationalOperator1;       /* '<Root>/Relational Operator1' */
} B;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  struct {
    void *LoggedData[2];
  } Scope_PWORK;                       /* '<Root>/Scope' */
} DW;

/* External data declarations for dependent source files */
extern const char_T *RT_MEMORY_ALLOCATION_ERROR;
extern B rtB;                          /* block i/o */
extern DW rtDW;                        /* states (dwork) */

/* Simulation Structure */
extern SimStruct *const rtS;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'generate_c_code'
 */

/* user code (bottom of header file) */
extern const int_T gblNumToFiles;
extern const int_T gblNumFrFiles;
extern const int_T gblNumFrWksBlocks;
extern rtInportTUtable *gblInportTUtables;
extern const char *gblInportFileName;
extern const int_T gblNumRootInportBlks;
extern const int_T gblNumModelInputs;
extern const int_T gblInportDataTypeIdx[];
extern const int_T gblInportDims[];
extern const int_T gblInportComplex[];
extern const int_T gblInportInterpoFlag[];
extern const int_T gblInportContinuous[];

#endif                                 /* generate_c_code_h_ */
