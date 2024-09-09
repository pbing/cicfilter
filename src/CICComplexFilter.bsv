package CICComplexFilter;

import Complex::*;
import GetPut::*;
import Vector::*;

import CICFilter_IFC::*;

export CICServer_IFC(..),
       CICClient_IFC(..),
       mkCICComplexDecimationFilter,
       mkCICComplexInterpolationFilter;

// convergent rounding
function Int#(n) roundLSB(Int#(m) x) provisos (Add#(n, k, m));
   let g = valueOf(m) - valueOf(n);
   let h = 2**(g - 1);                 // half LSB for rounding
   let xp = pack(x);
   let r  = xp[g] == 1'b1 ? h : h - 1; // either 'b1000... or 'b0111...
   return unpack(truncateLSB(xp + fromInteger(r)));
endfunction

/********************************************************************************
* Decimation Filter
*
* R = integer range change factor
* N = number of comb stages
* M = differential delay (usually 1 or 2)
* G = ceil((R M) ^ N)
********************************************************************************/
module mkCICComplexDecimationFilter (CICServer_IFC#(r, n, m, g, Complex#(Int#(sa)), Complex#(Int#(sb))))
   provisos (Add#(1, a__, n),
             Add#(1, b__, m),
             Add#(sa, g, sf),
             Add#(sb, c__, sf));

   Vector#(n, Reg#(Complex#(Int#(sf)))) istg <- replicateM(mkReg(0));
   Vector#(n, Reg#(Complex#(Int#(sf)))) dstg <- replicateM(mkReg(0));
   Vector#(n, Vector#(m, Reg#(Complex#(Int#(sf))))) ddly <- replicateM(replicateM(mkReg(0)));
   Reg#(Bit#(TLog#(r))) count <- mkReg(0);
   Wire#(Complex#(Int#(sf))) wr_x <- mkWire;

   let tick = count == fromInteger(valueOf(r) - 1);

   rule rl_integrators;
      for (Integer i = 0; i < valueOf(n); i = i + 1)
         if (i == 0)
            istg[i] <= istg[i] + wr_x;
         else
            istg[i] <= istg[i] + istg[i-1];
   endrule

   rule rl_comb (tick);
      let last_istg = last(istg);

      for (Integer i = 0; i < valueOf(n); i = i + 1) begin
         let last_ddly = last(ddly[i]);

         for (Integer j = 0; j < valueOf(m); j = j + 1)
            if (j == 0)
               if (i == 0)
                  ddly[i][j] <= last_istg;
               else
                  ddly[i][j] <= dstg[i-1];
            else
               ddly[i][j] <= ddly[i][j-1];

         if (i == 0)
            dstg[i] <= last_istg - last_ddly;
         else
            dstg[i] <= dstg[i-1] - last_ddly;
      end
   endrule

   rule rl_count;
      if (tick)
         count <= 0;
      else
         count <= count + 1;
   endrule

   interface Put request;
      method Action put(x);
         wr_x <= cmplxMap(extend, x);
      endmethod
   endinterface

   interface Get response;
      method ActionValue#(Complex#(Int#(sb))) get() if (tick);
         return cmplxMap(roundLSB, readReg(last(dstg)));
      endmethod
   endinterface
endmodule

/********************************************************************************
* Interpolation Filter
*
* R = integer range change factor
* N = number of comb stages
* M = differential delay (usually 1 or 2)
* G = ceil((R M) ^ N)
*******************************************************************************/

module mkCICComplexInterpolationFilter (CICServer_IFC#(r, n, m, g, Complex#(Int#(sa)), Complex#(Int#(sb))))
   provisos (Add#(1, a__, n),
             Add#(1, b__, m),
             Add#(sa, g, sf),
             Add#(sb, c__, sf),
             Add#(sc, d__, sf),
             Add#(sa, n, sc));

   Vector#(n, Reg#(Complex#(Int#(sf)))) istg <- replicateM(mkReg(0));
   Vector#(n, Reg#(Complex#(Int#(sc)))) dstg <- replicateM(mkReg(0));
   Vector#(n, Vector#(m, Reg#(Complex#(Int#(sc))))) ddly <- replicateM(replicateM(mkReg(0)));
   Reg#(Bit#(TLog#(r))) count <- mkReg(0);
   Wire#(Complex#(Int#(sc))) wr_x <- mkWire;

   let tick = count == fromInteger(valueOf(r) - 1);

   rule rl_comb;
      for (Integer i = 0; i < valueOf(n); i = i + 1) begin
         let last_ddly = last(ddly[i]);

         for (Integer j = 0; j < valueOf(m); j = j + 1)
            if (j == 0)
               if (i == 0)
                  ddly[i][j] <= wr_x;
               else
                  ddly[i][j] <= dstg[i-1];
            else
               ddly[i][j] <= ddly[i][j-1];

         if (i == 0)
            dstg[i] <= wr_x - last_ddly;
         else
            dstg[i] <= dstg[i-1] - last_ddly;
      end
   endrule

   rule rl_integrators;
      for (Integer i = 0; i < valueOf(n); i = i + 1)
         if (i == 0)
            istg[i] <= istg[i] + cmplxMap(extend, readReg(last(dstg)));
         else
            istg[i] <= istg[i] + istg[i-1];
   endrule

   rule rl_count;
      if (tick)
         count <= 0;
      else
         count <= count + 1;
   endrule

   // assumes constant 'x' between ticks
   interface Put request;
      method Action put(x) if (tick);
         wr_x <= cmplxMap(extend, x);
      endmethod
   endinterface

   interface Get response;
      method ActionValue#(Complex#(Int#(sb))) get();
         return cmplxMap(roundLSB, readReg(last(istg)));
      endmethod
   endinterface
endmodule

endpackage
