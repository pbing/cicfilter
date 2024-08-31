/* Testbench */

package Tb;

import GetPut::*;
import CICFilter::*;

(* synthesize *)
module mkTb1(Empty);
   Reg#(int) count <- mkReg(0);
   let       dut <- mkCICDecimationFilter_4_3_2;
   
   rule rl_1 (count > 0);
      //let x = 1;
      //let x = -1;
      let x = 2047;
      //let x = -2048;
      dut.request.put(x);
   endrule

   rule rl_monitor;
      let res <- dut.response.get();
      $display($time, fshow(res));
   endrule

   rule rl_count;
      count <= count + 1;
   endrule
endmodule

(* synthesize *)
module mkTb2(Empty);
   Reg#(int) count <- mkReg(0);
   let       dut <- mkCICInterpolationFilter_4_3_2;
   
   rule rl_1 (count > 0);
      //let x = 1;
      //let x = -1;
      let x = 2047;
      //let x = -2048;
      dut.request.put(x);
   endrule

   rule rl_monitor;
      let res <- dut.response.get();
      $display($time, fshow(res));
   endrule

   rule rl_count;
      count <= count + 1;
   endrule
endmodule

/*
R = 4
N = 3
M = 2
(R * M)^N = 8^3 = 512
log2(512) = 9

input:  Int#(12)
output: Int#(12 + 9) = Int#(21)
*/
(* synthesize *)
module mkCICDecimationFilter_4_3_2 (CICServer_IFC#(4, 3, 2, 12, 12));
   let ifc <- mkCICDecimationFilter;
   return ifc;
endmodule

(* synthesize *)
module mkCICInterpolationFilter_4_3_2 (CICServer_IFC#(4, 3, 2, 12, 12));
   let ifc <- mkCICInterpolationFilter;
   return ifc;
endmodule

endpackage
