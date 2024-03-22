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

#include "loop_max_bounds.h"

dout_t loop_max_bounds(din_t A[N], dsel_t width) {  

  dout_t out_accum=0;
  dsel_t x;
  
  LOOP_X:for (x=0;x<N-1; x++) {
    if (x<width) {
      out_accum += A[x];
    }
  }

  return out_accum;
}
