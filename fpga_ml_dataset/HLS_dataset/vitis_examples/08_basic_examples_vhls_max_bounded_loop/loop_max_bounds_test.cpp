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
 
int main () {
  din_t A[N];
	dsel_t x=0;
	dout_t accum;
	
	int i, retval=0;
	ofstream FILE;

	for(i=0; i<N;++i) {
	  A[i]=i;
	}
	// Save the results to a file
	FILE.open ("result.dat");

	// Call the function
	for(i=0; i<N;++i) {
	  x=i;
	  accum = loop_max_bounds(A,x);
	  FILE << accum << endl;
	}
	FILE.close();

	// Compare the results file with the golden results
	retval = system("diff --brief -w result.dat result.golden.dat");
	if (retval != 0) {
	  cout << "Test failed  !!!" << endl; 
	  retval=1;
	} else {
	  cout << "Test passed !" << endl;
	}

	// Return 0 if the test passed
  return retval;
}

