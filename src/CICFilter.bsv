package CICFilter;

import ClientServer::*;
import GetPut::*;
import Vector::*;

// R = rate change factor
// N = number of comb stages
// M = differential delay per stage
//
// G_max = (R M)^N
interface CICClient_IFC#(numeric type r, numeric type n, numeric type m, numeric type sa, numeric type sb);
   interface Get#(Int#(sa)) request;
   interface Put#(Int#(sb)) response;
endinterface

interface CICServer_IFC#(numeric type r, numeric type n, numeric type m, numeric type sa, numeric type sb);
   interface Put#(Int#(sa)) request;
   interface Get#(Int#(sb)) response;
endinterface

/********************************************************************************
* Decimation Filter
********************************************************************************/
module mkCICDecimationFilter (CICServer_IFC#(r, n, m, sa, sb))
   provisos (Add#(1, a__, n),
             Add#(1, b__, m),
             Add#(sa, c__, sb),
             Add#(sb, d__, sf),
             Mul#(r, m, rm),
             Log#(rm, lrm),
             Mul#(lrm, n, lrmn),
             Add#(sa, lrmn, sf));

   Vector#(n, Reg#(Int#(sf))) istg  <- replicateM(mkReg(0));
   Vector#(n, Reg#(Int#(sf))) dstg  <- replicateM(mkReg(0));
   Vector#(n, Vector#(m, Reg#(Int#(sf)))) ddly  <- replicateM(replicateM(mkReg(0)));
   Reg#(Bit#(TLog#(r))) count <- mkReg(0);
   Wire#(Bool) tick  <- mkWire;
   Wire#(Int#(sf)) wr_x <- mkWire;

   rule rl_integrators;
      //for (Integer i = 1; i < valueOf(n); i = i + 1)
      //   istg[i] <= istg[i] + istg[i-1];
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
      count <= count + 1;
      tick <= count == fromInteger(valueOf(r) - 1);
   endrule

   interface Put request;
      method Action put(x);
         wr_x <= extend(x);
      endmethod
   endinterface

   interface Get response;
      method ActionValue#(Int#(sb)) get() if (tick);
         return unpack(truncateLSB(pack(readReg(last(dstg)))));
      endmethod
   endinterface
endmodule

/********************************************************************************
* Interpolation Filter
********************************************************************************/
module mkCICInterpolationFilter (CICServer_IFC#(r, n, m, sa, sb))
   provisos (Add#(1, a__, n),
             Add#(1, b__, m),
             Add#(sa, c__, sb),
             Add#(sb, d__, sf),
             Mul#(r, m, rm),
             Log#(rm, lrm),
             Mul#(lrm, n, lrmn),
             Add#(sa, lrmn, sf));

   Vector#(n, Reg#(Int#(sf))) istg  <- replicateM(mkReg(0));
   Vector#(n, Reg#(Int#(sf))) dstg  <- replicateM(mkReg(0));
   Vector#(n, Vector#(m, Reg#(Int#(sf)))) ddly  <- replicateM(replicateM(mkReg(0)));
   Reg#(Bit#(TLog#(r))) count <- mkReg(0);
   Wire#(Bool) tick  <- mkWire;
   Wire#(Int#(sf)) wr_x <- mkWire;

   rule rl_integrators;
      for (Integer i = 0; i < valueOf(n); i = i + 1)
         if (i == 0)
            istg[i] <= istg[i] + readReg(last(dstg));
         else
            istg[i] <= istg[i] + istg[i-1];
   endrule

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

   rule rl_count;
      count <= count + 1;
      tick <= count == fromInteger(valueOf(r) - 1);
   endrule

   // assumes constant 'x' between ticks
   interface Put request;
      method Action put(x) if (tick);
         wr_x <= extend(x);
      endmethod
   endinterface

   interface Get response;
      method ActionValue#(Int#(sb)) get();
         return unpack(truncateLSB(pack(readReg(last(istg)))));
      endmethod
   endinterface
endmodule

endpackage
