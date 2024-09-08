package CICFilter_IFC;

import GetPut::*;

// R = rate change factor
// N = number of comb stages
// M = differential delay per stage
//
// G_max = (R M)^N
interface CICClient_IFC#(numeric type r, numeric type n, numeric type m, type a, type b);
   interface Get#(a) request;
   interface Put#(b) response;
endinterface

interface CICServer_IFC#(numeric type r, numeric type n, numeric type m, type a, type b);
   interface Put#(a) request;
   interface Get#(b) response;
endinterface

endpackage
