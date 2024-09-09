/* Testbench */

package Tb;

import Complex::*;
import GetPut::*;

import CICFilter::*;
import CICComplexFilter::*;

(* synthesize *)
module mkTb1(Empty);
   Reg#(int) count <- mkReg(0);
   let       dut <- mkCICDecimationFilter_25_4_1_19_16_16;

   rule rl_1 (count > 0);
      //let x = 1;
      //let x = -1;
      let x = 16'h7fff;
      //let x = -16'h8000;
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
   let       dut <- mkCICInterpolationFilter_64_4_2_28_8_8;

   rule rl_1 (count > 0);
      //let x = 1;
      //let x = -1;
      let x = 8'h7f;
      //let x = -8'h80;
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
module mkTb3(Empty);
   Reg#(int) count <- mkReg(0);
   let       dut <- mkCICComplexDecimationFilter_25_4_1_19_16_16;

   rule rl_1 (count > 0);
      //let x = cmplx(1, -1);
      let x = cmplx(16'h7fff, -16'h8000);
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
module mkTb4(Empty);
   Reg#(int) count <- mkReg(0);
   let       dut <- mkCICComplexInterpolationFilter_64_4_2_28_8_8;

   rule rl_1 (count > 0);
      //let x = cmplx(1, -1);
      let x = cmplx(8'h7f, -8'h80);
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

// Fig. 5. Example CIC decimation filter for N = 4, M = 1, and R = 25.
(* synthesize *)
module mkCICDecimationFilter_25_4_1_19_16_16 (CICServer_IFC#(25, 4, 1, 19, Int#(16), Int#(16)));
   let ifc <- mkCICDecimationFilter;
   return ifc;
endmodule

// Fig. 6. Example CIC interpolation filter N = 4, M = 2, and R = 64.
(* synthesize *)
module mkCICInterpolationFilter_64_4_2_28_8_8 (CICServer_IFC#(64, 4, 2, 28, Int#(8), Int#(8)));
   let ifc <- mkCICInterpolationFilter;
   return ifc;
endmodule

// Fig. 5. Example CIC decimation filter for N = 4, M = 1, and R = 25.
(* synthesize *)
module mkCICComplexDecimationFilter_25_4_1_19_16_16 (CICServer_IFC#(25, 4, 1, 19, Complex#(Int#(16)), Complex#(Int#(16))));
   let ifc <- mkCICComplexDecimationFilter;
   return ifc;
endmodule

// Fig. 6. Example CIC interpolation filter N = 4, M = 2, and R = 64.
(* synthesize *)
module mkCICComplexInterpolationFilter_64_4_2_28_8_8 (CICServer_IFC#(64, 4, 2, 28, Complex#(Int#(8)), Complex#(Int#(8))));
   let ifc <- mkCICComplexInterpolationFilter;
   return ifc;
endmodule

endpackage
