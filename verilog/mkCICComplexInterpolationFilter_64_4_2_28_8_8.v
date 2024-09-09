//
// Generated by Bluespec Compiler, version 2024.07 (build b4f31db)
//
// On Mon Sep  9 19:12:47 CEST 2024
//
//
// Ports:
// Name                         I/O  size props
// RDY_request_put                O     1
// response_get                   O    16
// RDY_response_get               O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// request_put                    I    16
// EN_request_put                 I     1
// EN_response_get                I     1 unused
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkCICComplexInterpolationFilter_64_4_2_28_8_8(CLK,
						     RST_N,

						     request_put,
						     EN_request_put,
						     RDY_request_put,

						     EN_response_get,
						     response_get,
						     RDY_response_get);
  input  CLK;
  input  RST_N;

  // action method request_put
  input  [15 : 0] request_put;
  input  EN_request_put;
  output RDY_request_put;

  // actionvalue method response_get
  input  EN_response_get;
  output [15 : 0] response_get;
  output RDY_response_get;

  // signals for module outputs
  wire [15 : 0] response_get;
  wire RDY_request_put, RDY_response_get;

  // inlined wires
  wire [23 : 0] ifc_wr_x$wget;

  // register ifc_count
  reg [5 : 0] ifc_count;
  wire [5 : 0] ifc_count$D_IN;
  wire ifc_count$EN;

  // register ifc_ddly_0_0
  reg [23 : 0] ifc_ddly_0_0;
  wire [23 : 0] ifc_ddly_0_0$D_IN;
  wire ifc_ddly_0_0$EN;

  // register ifc_ddly_0_1
  reg [23 : 0] ifc_ddly_0_1;
  wire [23 : 0] ifc_ddly_0_1$D_IN;
  wire ifc_ddly_0_1$EN;

  // register ifc_ddly_1_0
  reg [23 : 0] ifc_ddly_1_0;
  wire [23 : 0] ifc_ddly_1_0$D_IN;
  wire ifc_ddly_1_0$EN;

  // register ifc_ddly_1_1
  reg [23 : 0] ifc_ddly_1_1;
  wire [23 : 0] ifc_ddly_1_1$D_IN;
  wire ifc_ddly_1_1$EN;

  // register ifc_ddly_2_0
  reg [23 : 0] ifc_ddly_2_0;
  wire [23 : 0] ifc_ddly_2_0$D_IN;
  wire ifc_ddly_2_0$EN;

  // register ifc_ddly_2_1
  reg [23 : 0] ifc_ddly_2_1;
  wire [23 : 0] ifc_ddly_2_1$D_IN;
  wire ifc_ddly_2_1$EN;

  // register ifc_ddly_3_0
  reg [23 : 0] ifc_ddly_3_0;
  wire [23 : 0] ifc_ddly_3_0$D_IN;
  wire ifc_ddly_3_0$EN;

  // register ifc_ddly_3_1
  reg [23 : 0] ifc_ddly_3_1;
  wire [23 : 0] ifc_ddly_3_1$D_IN;
  wire ifc_ddly_3_1$EN;

  // register ifc_dstg_0
  reg [23 : 0] ifc_dstg_0;
  wire [23 : 0] ifc_dstg_0$D_IN;
  wire ifc_dstg_0$EN;

  // register ifc_dstg_1
  reg [23 : 0] ifc_dstg_1;
  wire [23 : 0] ifc_dstg_1$D_IN;
  wire ifc_dstg_1$EN;

  // register ifc_dstg_2
  reg [23 : 0] ifc_dstg_2;
  wire [23 : 0] ifc_dstg_2$D_IN;
  wire ifc_dstg_2$EN;

  // register ifc_dstg_3
  reg [23 : 0] ifc_dstg_3;
  wire [23 : 0] ifc_dstg_3$D_IN;
  wire ifc_dstg_3$EN;

  // register ifc_istg_0
  reg [71 : 0] ifc_istg_0;
  wire [71 : 0] ifc_istg_0$D_IN;
  wire ifc_istg_0$EN;

  // register ifc_istg_1
  reg [71 : 0] ifc_istg_1;
  wire [71 : 0] ifc_istg_1$D_IN;
  wire ifc_istg_1$EN;

  // register ifc_istg_2
  reg [71 : 0] ifc_istg_2;
  wire [71 : 0] ifc_istg_2$D_IN;
  wire ifc_istg_2$EN;

  // register ifc_istg_3
  reg [71 : 0] ifc_istg_3;
  wire [71 : 0] ifc_istg_3$D_IN;
  wire ifc_istg_3$EN;

  // remaining internal signals
  wire [35 : 0] x__h4249, x__h4290;
  wire [11 : 0] ifc_dstg_3_BITS_11_TO_0__q4, ifc_dstg_3_BITS_23_TO_12__q3;
  wire [7 : 0] request_put_BITS_15_TO_8__q1, request_put_BITS_7_TO_0__q2;
  wire [5 : 0] x__h4157;

  // action method request_put
  assign RDY_request_put = ifc_count == 6'd63 ;

  // actionvalue method response_get
  assign response_get = { x__h4249[35:28], x__h4290[35:28] } ;
  assign RDY_response_get = 1'd1 ;

  // inlined wires
  assign ifc_wr_x$wget =
	     { { {4{request_put_BITS_15_TO_8__q1[7]}},
		 request_put_BITS_15_TO_8__q1 },
	       { {4{request_put_BITS_7_TO_0__q2[7]}},
		 request_put_BITS_7_TO_0__q2 } } ;

  // register ifc_count
  assign ifc_count$D_IN = (ifc_count == 6'd63) ? 6'd0 : x__h4157 ;
  assign ifc_count$EN = 1'd1 ;

  // register ifc_ddly_0_0
  assign ifc_ddly_0_0$D_IN = ifc_wr_x$wget ;
  assign ifc_ddly_0_0$EN = EN_request_put ;

  // register ifc_ddly_0_1
  assign ifc_ddly_0_1$D_IN = ifc_ddly_0_0 ;
  assign ifc_ddly_0_1$EN = EN_request_put ;

  // register ifc_ddly_1_0
  assign ifc_ddly_1_0$D_IN = ifc_dstg_0 ;
  assign ifc_ddly_1_0$EN = EN_request_put ;

  // register ifc_ddly_1_1
  assign ifc_ddly_1_1$D_IN = ifc_ddly_1_0 ;
  assign ifc_ddly_1_1$EN = EN_request_put ;

  // register ifc_ddly_2_0
  assign ifc_ddly_2_0$D_IN = ifc_dstg_1 ;
  assign ifc_ddly_2_0$EN = EN_request_put ;

  // register ifc_ddly_2_1
  assign ifc_ddly_2_1$D_IN = ifc_ddly_2_0 ;
  assign ifc_ddly_2_1$EN = EN_request_put ;

  // register ifc_ddly_3_0
  assign ifc_ddly_3_0$D_IN = ifc_dstg_2 ;
  assign ifc_ddly_3_0$EN = EN_request_put ;

  // register ifc_ddly_3_1
  assign ifc_ddly_3_1$D_IN = ifc_ddly_3_0 ;
  assign ifc_ddly_3_1$EN = EN_request_put ;

  // register ifc_dstg_0
  assign ifc_dstg_0$D_IN =
	     { ifc_wr_x$wget[23:12] - ifc_ddly_0_1[23:12],
	       ifc_wr_x$wget[11:0] - ifc_ddly_0_1[11:0] } ;
  assign ifc_dstg_0$EN = EN_request_put ;

  // register ifc_dstg_1
  assign ifc_dstg_1$D_IN =
	     { ifc_dstg_0[23:12] - ifc_ddly_1_1[23:12],
	       ifc_dstg_0[11:0] - ifc_ddly_1_1[11:0] } ;
  assign ifc_dstg_1$EN = EN_request_put ;

  // register ifc_dstg_2
  assign ifc_dstg_2$D_IN =
	     { ifc_dstg_1[23:12] - ifc_ddly_2_1[23:12],
	       ifc_dstg_1[11:0] - ifc_ddly_2_1[11:0] } ;
  assign ifc_dstg_2$EN = EN_request_put ;

  // register ifc_dstg_3
  assign ifc_dstg_3$D_IN =
	     { ifc_dstg_2[23:12] - ifc_ddly_3_1[23:12],
	       ifc_dstg_2[11:0] - ifc_ddly_3_1[11:0] } ;
  assign ifc_dstg_3$EN = EN_request_put ;

  // register ifc_istg_0
  assign ifc_istg_0$D_IN =
	     { ifc_istg_0[71:36] +
	       { {24{ifc_dstg_3_BITS_23_TO_12__q3[11]}},
		 ifc_dstg_3_BITS_23_TO_12__q3 },
	       ifc_istg_0[35:0] +
	       { {24{ifc_dstg_3_BITS_11_TO_0__q4[11]}},
		 ifc_dstg_3_BITS_11_TO_0__q4 } } ;
  assign ifc_istg_0$EN = 1'd1 ;

  // register ifc_istg_1
  assign ifc_istg_1$D_IN =
	     { ifc_istg_1[71:36] + ifc_istg_0[71:36],
	       ifc_istg_1[35:0] + ifc_istg_0[35:0] } ;
  assign ifc_istg_1$EN = 1'd1 ;

  // register ifc_istg_2
  assign ifc_istg_2$D_IN =
	     { ifc_istg_2[71:36] + ifc_istg_1[71:36],
	       ifc_istg_2[35:0] + ifc_istg_1[35:0] } ;
  assign ifc_istg_2$EN = 1'd1 ;

  // register ifc_istg_3
  assign ifc_istg_3$D_IN =
	     { ifc_istg_3[71:36] + ifc_istg_2[71:36],
	       ifc_istg_3[35:0] + ifc_istg_2[35:0] } ;
  assign ifc_istg_3$EN = 1'd1 ;

  // remaining internal signals
  assign ifc_dstg_3_BITS_11_TO_0__q4 = ifc_dstg_3[11:0] ;
  assign ifc_dstg_3_BITS_23_TO_12__q3 = ifc_dstg_3[23:12] ;
  assign request_put_BITS_15_TO_8__q1 = request_put[15:8] ;
  assign request_put_BITS_7_TO_0__q2 = request_put[7:0] ;
  assign x__h4157 = ifc_count + 6'd1 ;
  assign x__h4249 =
	     ifc_istg_3[71:36] +
	     (ifc_istg_3[64] ? 36'd134217728 : 36'd134217727) ;
  assign x__h4290 =
	     ifc_istg_3[35:0] +
	     (ifc_istg_3[28] ? 36'd134217728 : 36'd134217727) ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        ifc_count <= `BSV_ASSIGNMENT_DELAY 6'd0;
	ifc_ddly_0_0 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_ddly_0_1 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_ddly_1_0 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_ddly_1_1 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_ddly_2_0 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_ddly_2_1 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_ddly_3_0 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_ddly_3_1 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_dstg_0 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_dstg_1 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_dstg_2 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_dstg_3 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ifc_istg_0 <= `BSV_ASSIGNMENT_DELAY 72'd0;
	ifc_istg_1 <= `BSV_ASSIGNMENT_DELAY 72'd0;
	ifc_istg_2 <= `BSV_ASSIGNMENT_DELAY 72'd0;
	ifc_istg_3 <= `BSV_ASSIGNMENT_DELAY 72'd0;
      end
    else
      begin
        if (ifc_count$EN) ifc_count <= `BSV_ASSIGNMENT_DELAY ifc_count$D_IN;
	if (ifc_ddly_0_0$EN)
	  ifc_ddly_0_0 <= `BSV_ASSIGNMENT_DELAY ifc_ddly_0_0$D_IN;
	if (ifc_ddly_0_1$EN)
	  ifc_ddly_0_1 <= `BSV_ASSIGNMENT_DELAY ifc_ddly_0_1$D_IN;
	if (ifc_ddly_1_0$EN)
	  ifc_ddly_1_0 <= `BSV_ASSIGNMENT_DELAY ifc_ddly_1_0$D_IN;
	if (ifc_ddly_1_1$EN)
	  ifc_ddly_1_1 <= `BSV_ASSIGNMENT_DELAY ifc_ddly_1_1$D_IN;
	if (ifc_ddly_2_0$EN)
	  ifc_ddly_2_0 <= `BSV_ASSIGNMENT_DELAY ifc_ddly_2_0$D_IN;
	if (ifc_ddly_2_1$EN)
	  ifc_ddly_2_1 <= `BSV_ASSIGNMENT_DELAY ifc_ddly_2_1$D_IN;
	if (ifc_ddly_3_0$EN)
	  ifc_ddly_3_0 <= `BSV_ASSIGNMENT_DELAY ifc_ddly_3_0$D_IN;
	if (ifc_ddly_3_1$EN)
	  ifc_ddly_3_1 <= `BSV_ASSIGNMENT_DELAY ifc_ddly_3_1$D_IN;
	if (ifc_dstg_0$EN)
	  ifc_dstg_0 <= `BSV_ASSIGNMENT_DELAY ifc_dstg_0$D_IN;
	if (ifc_dstg_1$EN)
	  ifc_dstg_1 <= `BSV_ASSIGNMENT_DELAY ifc_dstg_1$D_IN;
	if (ifc_dstg_2$EN)
	  ifc_dstg_2 <= `BSV_ASSIGNMENT_DELAY ifc_dstg_2$D_IN;
	if (ifc_dstg_3$EN)
	  ifc_dstg_3 <= `BSV_ASSIGNMENT_DELAY ifc_dstg_3$D_IN;
	if (ifc_istg_0$EN)
	  ifc_istg_0 <= `BSV_ASSIGNMENT_DELAY ifc_istg_0$D_IN;
	if (ifc_istg_1$EN)
	  ifc_istg_1 <= `BSV_ASSIGNMENT_DELAY ifc_istg_1$D_IN;
	if (ifc_istg_2$EN)
	  ifc_istg_2 <= `BSV_ASSIGNMENT_DELAY ifc_istg_2$D_IN;
	if (ifc_istg_3$EN)
	  ifc_istg_3 <= `BSV_ASSIGNMENT_DELAY ifc_istg_3$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    ifc_count = 6'h2A;
    ifc_ddly_0_0 = 24'hAAAAAA;
    ifc_ddly_0_1 = 24'hAAAAAA;
    ifc_ddly_1_0 = 24'hAAAAAA;
    ifc_ddly_1_1 = 24'hAAAAAA;
    ifc_ddly_2_0 = 24'hAAAAAA;
    ifc_ddly_2_1 = 24'hAAAAAA;
    ifc_ddly_3_0 = 24'hAAAAAA;
    ifc_ddly_3_1 = 24'hAAAAAA;
    ifc_dstg_0 = 24'hAAAAAA;
    ifc_dstg_1 = 24'hAAAAAA;
    ifc_dstg_2 = 24'hAAAAAA;
    ifc_dstg_3 = 24'hAAAAAA;
    ifc_istg_0 = 72'hAAAAAAAAAAAAAAAAAA;
    ifc_istg_1 = 72'hAAAAAAAAAAAAAAAAAA;
    ifc_istg_2 = 72'hAAAAAAAAAAAAAAAAAA;
    ifc_istg_3 = 72'hAAAAAAAAAAAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkCICComplexInterpolationFilter_64_4_2_28_8_8

