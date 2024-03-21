/*
 * Copyright 2020 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _LOOP_PIPELINE_H_
#define _LOOP_PIPELINE_H_

#include <iostream>
#include <fstream>
using namespace std;

#include "ap_int.h"
#define N 20
#define NUM_TRANS 20

typedef ap_int<5>  din_t;
typedef ap_int<20> dout_t;

dout_t loop_pipeline(din_t A[N]);

#endif

