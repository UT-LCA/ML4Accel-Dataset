#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <HLS/hls.h>
#include <HLS/stdio.h>
#define N 64

#define DATA_TYPE float
#define SCALAR_VAL(x) x##f
#define SQRT_FUN(x) sqrtf(x)
#define EXP_FUN(x) expf(x)
#define POW_FUN(x,y) powf(x,y)

void syr2k(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE A[N][N], DATA_TYPE B[N][N], DATA_TYPE C[N][N], DATA_TYPE D_out[N][N]);
