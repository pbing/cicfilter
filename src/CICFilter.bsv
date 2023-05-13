package CICFilter;

import ClientServer::*;
import GetPut::*;
import Vector::*;

// R = rate change factor
// N = number of comb stages
// M = differential delay per stage
//
// G_max = (R M)^N
interface CICClient_IFC#(numeric type r, numeric type n, numeric type m, type a);
   interface Get#(any_t) request;
   interface Put#(any_t) response;
endinterface

interface CICServer_IFC#(numeric type r, numeric type n, numeric type m, type a);
   interface Put#(a) request;
   interface Get#(a) response;
endinterface

module mkCICDecimationFilter (CICServer_IFC#(r, n, m, a))
   provisos (Bits#(a, sa), Arith#(a), FShow#(a),
             Add#(a__, 1, n),
             Add#(b__, 1, m));
   Vector#(n, Reg#(a))             istg  <- replicateM(mkReg(0));
   Vector#(n, Reg#(a))             dstg  <- replicateM(mkReg(0));
   Vector#(n, Vector#(m, Reg#(a))) ddly  <- replicateM(replicateM(mkReg(0)));
   Reg#(Bit#(TLog#(r)))            count <- mkReg(0);
   Wire#(Bool)                     tick  <- mkWire;

   rule rl_integrators;
      for (Integer i = 1; i < valueOf(n); i = i + 1)
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
         istg[0] <= istg[0] + x;
      endmethod
   endinterface

   interface Get response;
      method ActionValue#(a) get() if (tick);
         return readReg(last(dstg));
      endmethod
   endinterface
endmodule

endpackage
