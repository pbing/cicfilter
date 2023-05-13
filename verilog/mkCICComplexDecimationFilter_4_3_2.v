//
// Generated by Bluespec Compiler, version 2023.01 (build 52adafa)
//
// On Sat May 13 10:15:01 CEST 2023
//
//
// Ports:
// Name                         I/O  size props
// RDY_request_put                O     1 const
// response_get                   O    42 reg
// RDY_response_get               O     1
// CLK                            I     1 clock
// RST_N                          I     1 reset
// request_put                    I    42
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

module mkCICComplexDecimationFilter_4_3_2(CLK,
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
  input  [41 : 0] request_put;
  input  EN_request_put;
  output RDY_request_put;

  // actionvalue method response_get
  input  EN_response_get;
  output [41 : 0] response_get;
  output RDY_response_get;

  // signals for module outputs
  wire [41 : 0] response_get;
  wire RDY_request_put, RDY_response_get;

  // register ifc_count
  reg [1 : 0] ifc_count;
  wire [1 : 0] ifc_count$D_IN;
  wire ifc_count$EN;

  // register ifc_ddly_0_0
  reg [41 : 0] ifc_ddly_0_0;
  wire [41 : 0] ifc_ddly_0_0$D_IN;
  wire ifc_ddly_0_0$EN;

  // register ifc_ddly_0_1
  reg [41 : 0] ifc_ddly_0_1;
  wire [41 : 0] ifc_ddly_0_1$D_IN;
  wire ifc_ddly_0_1$EN;

  // register ifc_ddly_1_0
  reg [41 : 0] ifc_ddly_1_0;
  wire [41 : 0] ifc_ddly_1_0$D_IN;
  wire ifc_ddly_1_0$EN;

  // register ifc_ddly_1_1
  reg [41 : 0] ifc_ddly_1_1;
  wire [41 : 0] ifc_ddly_1_1$D_IN;
  wire ifc_ddly_1_1$EN;

  // register ifc_ddly_2_0
  reg [41 : 0] ifc_ddly_2_0;
  wire [41 : 0] ifc_ddly_2_0$D_IN;
  wire ifc_ddly_2_0$EN;

  // register ifc_ddly_2_1
  reg [41 : 0] ifc_ddly_2_1;
  wire [41 : 0] ifc_ddly_2_1$D_IN;
  wire ifc_ddly_2_1$EN;

  // register ifc_dstg_0
  reg [41 : 0] ifc_dstg_0;
  wire [41 : 0] ifc_dstg_0$D_IN;
  wire ifc_dstg_0$EN;

  // register ifc_dstg_1
  reg [41 : 0] ifc_dstg_1;
  wire [41 : 0] ifc_dstg_1$D_IN;
  wire ifc_dstg_1$EN;

  // register ifc_dstg_2
  reg [41 : 0] ifc_dstg_2;
  wire [41 : 0] ifc_dstg_2$D_IN;
  wire ifc_dstg_2$EN;

  // register ifc_istg_0
  reg [41 : 0] ifc_istg_0;
  wire [41 : 0] ifc_istg_0$D_IN;
  wire ifc_istg_0$EN;

  // register ifc_istg_1
  reg [41 : 0] ifc_istg_1;
  wire [41 : 0] ifc_istg_1$D_IN;
  wire ifc_istg_1$EN;

  // register ifc_istg_2
  reg [41 : 0] ifc_istg_2;
  wire [41 : 0] ifc_istg_2$D_IN;
  wire ifc_istg_2$EN;

  // action method request_put
  assign RDY_request_put = 1'd1 ;

  // actionvalue method response_get
  assign response_get = ifc_dstg_2 ;
  assign RDY_response_get = ifc_count == 2'd3 ;

  // register ifc_count
  assign ifc_count$D_IN = ifc_count + 2'd1 ;
  assign ifc_count$EN = 1'd1 ;

  // register ifc_ddly_0_0
  assign ifc_ddly_0_0$D_IN = ifc_istg_2 ;
  assign ifc_ddly_0_0$EN = ifc_count == 2'd3 ;

  // register ifc_ddly_0_1
  assign ifc_ddly_0_1$D_IN = ifc_ddly_0_0 ;
  assign ifc_ddly_0_1$EN = ifc_count == 2'd3 ;

  // register ifc_ddly_1_0
  assign ifc_ddly_1_0$D_IN = ifc_dstg_0 ;
  assign ifc_ddly_1_0$EN = ifc_count == 2'd3 ;

  // register ifc_ddly_1_1
  assign ifc_ddly_1_1$D_IN = ifc_ddly_1_0 ;
  assign ifc_ddly_1_1$EN = ifc_count == 2'd3 ;

  // register ifc_ddly_2_0
  assign ifc_ddly_2_0$D_IN = ifc_dstg_1 ;
  assign ifc_ddly_2_0$EN = ifc_count == 2'd3 ;

  // register ifc_ddly_2_1
  assign ifc_ddly_2_1$D_IN = ifc_ddly_2_0 ;
  assign ifc_ddly_2_1$EN = ifc_count == 2'd3 ;

  // register ifc_dstg_0
  assign ifc_dstg_0$D_IN =
	     { ifc_istg_2[41:21] - ifc_ddly_0_1[41:21],
	       ifc_istg_2[20:0] - ifc_ddly_0_1[20:0] } ;
  assign ifc_dstg_0$EN = ifc_count == 2'd3 ;

  // register ifc_dstg_1
  assign ifc_dstg_1$D_IN =
	     { ifc_dstg_0[41:21] - ifc_ddly_1_1[41:21],
	       ifc_dstg_0[20:0] - ifc_ddly_1_1[20:0] } ;
  assign ifc_dstg_1$EN = ifc_count == 2'd3 ;

  // register ifc_dstg_2
  assign ifc_dstg_2$D_IN =
	     { ifc_dstg_1[41:21] - ifc_ddly_2_1[41:21],
	       ifc_dstg_1[20:0] - ifc_ddly_2_1[20:0] } ;
  assign ifc_dstg_2$EN = ifc_count == 2'd3 ;

  // register ifc_istg_0
  assign ifc_istg_0$D_IN =
	     { ifc_istg_0[41:21] + request_put[41:21],
	       ifc_istg_0[20:0] + request_put[20:0] } ;
  assign ifc_istg_0$EN = EN_request_put ;

  // register ifc_istg_1
  assign ifc_istg_1$D_IN =
	     { ifc_istg_1[41:21] + ifc_istg_0[41:21],
	       ifc_istg_1[20:0] + ifc_istg_0[20:0] } ;
  assign ifc_istg_1$EN = 1'd1 ;

  // register ifc_istg_2
  assign ifc_istg_2$D_IN =
	     { ifc_istg_2[41:21] + ifc_istg_1[41:21],
	       ifc_istg_2[20:0] + ifc_istg_1[20:0] } ;
  assign ifc_istg_2$EN = 1'd1 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        ifc_count <= `BSV_ASSIGNMENT_DELAY 2'd0;
	ifc_ddly_0_0 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_ddly_0_1 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_ddly_1_0 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_ddly_1_1 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_ddly_2_0 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_ddly_2_1 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_dstg_0 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_dstg_1 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_dstg_2 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_istg_0 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_istg_1 <= `BSV_ASSIGNMENT_DELAY 42'd0;
	ifc_istg_2 <= `BSV_ASSIGNMENT_DELAY 42'd0;
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
	if (ifc_dstg_0$EN)
	  ifc_dstg_0 <= `BSV_ASSIGNMENT_DELAY ifc_dstg_0$D_IN;
	if (ifc_dstg_1$EN)
	  ifc_dstg_1 <= `BSV_ASSIGNMENT_DELAY ifc_dstg_1$D_IN;
	if (ifc_dstg_2$EN)
	  ifc_dstg_2 <= `BSV_ASSIGNMENT_DELAY ifc_dstg_2$D_IN;
	if (ifc_istg_0$EN)
	  ifc_istg_0 <= `BSV_ASSIGNMENT_DELAY ifc_istg_0$D_IN;
	if (ifc_istg_1$EN)
	  ifc_istg_1 <= `BSV_ASSIGNMENT_DELAY ifc_istg_1$D_IN;
	if (ifc_istg_2$EN)
	  ifc_istg_2 <= `BSV_ASSIGNMENT_DELAY ifc_istg_2$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    ifc_count = 2'h2;
    ifc_ddly_0_0 = 42'h2AAAAAAAAAA;
    ifc_ddly_0_1 = 42'h2AAAAAAAAAA;
    ifc_ddly_1_0 = 42'h2AAAAAAAAAA;
    ifc_ddly_1_1 = 42'h2AAAAAAAAAA;
    ifc_ddly_2_0 = 42'h2AAAAAAAAAA;
    ifc_ddly_2_1 = 42'h2AAAAAAAAAA;
    ifc_dstg_0 = 42'h2AAAAAAAAAA;
    ifc_dstg_1 = 42'h2AAAAAAAAAA;
    ifc_dstg_2 = 42'h2AAAAAAAAAA;
    ifc_istg_0 = 42'h2AAAAAAAAAA;
    ifc_istg_1 = 42'h2AAAAAAAAAA;
    ifc_istg_2 = 42'h2AAAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkCICComplexDecimationFilter_4_3_2

