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

void gesummv(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE A[N][N], DATA_TYPE B[N][N], DATA_TYPE x[N], DATA_TYPE y_out[N]);
