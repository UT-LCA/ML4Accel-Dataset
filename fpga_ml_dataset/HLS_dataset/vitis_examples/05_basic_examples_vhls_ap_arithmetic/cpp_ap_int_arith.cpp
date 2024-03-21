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

#include "cpp_ap_int_arith.h"

void cpp_ap_int_arith(dinA_t  inA, dinB_t  inB, dinC_t  inC, dinD_t  inD,
  		       dout1_t *out1, dout2_t *out2, dout3_t *out3, dout4_t *out4
  ) {

	// Basic arithmetic operations
	*out1 = inA * inB;
	*out2 = inB + inA;
	*out3 = inC / inA;
	*out4 = inD % inA;

} 
