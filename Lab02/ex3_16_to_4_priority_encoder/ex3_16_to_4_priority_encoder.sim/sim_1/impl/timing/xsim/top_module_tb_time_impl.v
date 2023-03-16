// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed Mar 15 00:41:54 2023
// Host        : DESKTOP-6BOE7R7 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Workplace/SUSTech-EE332-Digital-System-Designing-Laboratory/Lab02/ex3_16_to_4_priority_encoder/ex3_16_to_4_priority_encoder.sim/sim_1/impl/timing/xsim/top_module_tb_time_impl.v
// Design      : top_module
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "6a35fa6e" *) 
(* NotValidForBitStream *)
module top_module
   (S,
    Z,
    r);
  input [15:0]S;
  output [3:0]Z;
  output r;

  wire [15:0]S;
  wire [15:0]S_IBUF;
  wire [3:0]Z;
  wire [3:0]Z_OBUF;
  wire \Z_OBUF[0]_inst_i_2_n_0 ;
  wire \Z_OBUF[0]_inst_i_3_n_0 ;
  wire \Z_OBUF[0]_inst_i_4_n_0 ;
  wire \Z_OBUF[0]_inst_i_5_n_0 ;
  wire \Z_OBUF[0]_inst_i_6_n_0 ;
  wire \Z_OBUF[0]_inst_i_7_n_0 ;
  wire \Z_OBUF[1]_inst_i_2_n_0 ;
  wire \Z_OBUF[1]_inst_i_3_n_0 ;
  wire \Z_OBUF[1]_inst_i_4_n_0 ;
  wire \Z_OBUF[2]_inst_i_2_n_0 ;
  wire \Z_OBUF[3]_inst_i_2_n_0 ;
  wire r;
  wire r_OBUF;
  wire r_OBUF_inst_i_2_n_0;
  wire r_OBUF_inst_i_3_n_0;

initial begin
 $sdf_annotate("top_module_tb_time_impl.sdf",,,,"tool_control");
end
  IBUF \S_IBUF[0]_inst 
       (.I(S[0]),
        .O(S_IBUF[0]));
  IBUF \S_IBUF[10]_inst 
       (.I(S[10]),
        .O(S_IBUF[10]));
  IBUF \S_IBUF[11]_inst 
       (.I(S[11]),
        .O(S_IBUF[11]));
  IBUF \S_IBUF[12]_inst 
       (.I(S[12]),
        .O(S_IBUF[12]));
  IBUF \S_IBUF[13]_inst 
       (.I(S[13]),
        .O(S_IBUF[13]));
  IBUF \S_IBUF[14]_inst 
       (.I(S[14]),
        .O(S_IBUF[14]));
  IBUF \S_IBUF[15]_inst 
       (.I(S[15]),
        .O(S_IBUF[15]));
  IBUF \S_IBUF[1]_inst 
       (.I(S[1]),
        .O(S_IBUF[1]));
  IBUF \S_IBUF[2]_inst 
       (.I(S[2]),
        .O(S_IBUF[2]));
  IBUF \S_IBUF[3]_inst 
       (.I(S[3]),
        .O(S_IBUF[3]));
  IBUF \S_IBUF[4]_inst 
       (.I(S[4]),
        .O(S_IBUF[4]));
  IBUF \S_IBUF[5]_inst 
       (.I(S[5]),
        .O(S_IBUF[5]));
  IBUF \S_IBUF[6]_inst 
       (.I(S[6]),
        .O(S_IBUF[6]));
  IBUF \S_IBUF[7]_inst 
       (.I(S[7]),
        .O(S_IBUF[7]));
  IBUF \S_IBUF[8]_inst 
       (.I(S[8]),
        .O(S_IBUF[8]));
  IBUF \S_IBUF[9]_inst 
       (.I(S[9]),
        .O(S_IBUF[9]));
  OBUF \Z_OBUF[0]_inst 
       (.I(Z_OBUF[0]),
        .O(Z[0]));
  LUT6 #(
    .INIT(64'h00000000EEEEFEEE)) 
    \Z_OBUF[0]_inst_i_1 
       (.I0(\Z_OBUF[0]_inst_i_2_n_0 ),
        .I1(\Z_OBUF[0]_inst_i_3_n_0 ),
        .I2(\Z_OBUF[0]_inst_i_4_n_0 ),
        .I3(\Z_OBUF[0]_inst_i_5_n_0 ),
        .I4(\Z_OBUF[0]_inst_i_6_n_0 ),
        .I5(\Z_OBUF[0]_inst_i_7_n_0 ),
        .O(Z_OBUF[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \Z_OBUF[0]_inst_i_2 
       (.I0(S_IBUF[11]),
        .I1(S_IBUF[10]),
        .I2(S_IBUF[14]),
        .I3(S_IBUF[15]),
        .I4(S_IBUF[12]),
        .I5(S_IBUF[13]),
        .O(\Z_OBUF[0]_inst_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \Z_OBUF[0]_inst_i_3 
       (.I0(S_IBUF[9]),
        .I1(S_IBUF[8]),
        .I2(S_IBUF[7]),
        .O(\Z_OBUF[0]_inst_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBABBBABA)) 
    \Z_OBUF[0]_inst_i_4 
       (.I0(S_IBUF[5]),
        .I1(S_IBUF[4]),
        .I2(S_IBUF[3]),
        .I3(S_IBUF[2]),
        .I4(S_IBUF[1]),
        .O(\Z_OBUF[0]_inst_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \Z_OBUF[0]_inst_i_5 
       (.I0(S_IBUF[6]),
        .I1(S_IBUF[7]),
        .O(\Z_OBUF[0]_inst_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Z_OBUF[0]_inst_i_6 
       (.I0(S_IBUF[8]),
        .I1(S_IBUF[9]),
        .O(\Z_OBUF[0]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h3033303330303032)) 
    \Z_OBUF[0]_inst_i_7 
       (.I0(S_IBUF[10]),
        .I1(S_IBUF[15]),
        .I2(S_IBUF[14]),
        .I3(S_IBUF[13]),
        .I4(S_IBUF[11]),
        .I5(S_IBUF[12]),
        .O(\Z_OBUF[0]_inst_i_7_n_0 ));
  OBUF \Z_OBUF[1]_inst 
       (.I(Z_OBUF[1]),
        .O(Z[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF00F8)) 
    \Z_OBUF[1]_inst_i_1 
       (.I0(\Z_OBUF[2]_inst_i_2_n_0 ),
        .I1(\Z_OBUF[1]_inst_i_2_n_0 ),
        .I2(\Z_OBUF[1]_inst_i_3_n_0 ),
        .I3(\Z_OBUF[1]_inst_i_4_n_0 ),
        .I4(S_IBUF[14]),
        .I5(S_IBUF[15]),
        .O(Z_OBUF[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF1110)) 
    \Z_OBUF[1]_inst_i_2 
       (.I0(S_IBUF[4]),
        .I1(S_IBUF[5]),
        .I2(S_IBUF[2]),
        .I3(S_IBUF[3]),
        .I4(S_IBUF[7]),
        .I5(S_IBUF[6]),
        .O(\Z_OBUF[1]_inst_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \Z_OBUF[1]_inst_i_3 
       (.I0(S_IBUF[10]),
        .I1(S_IBUF[11]),
        .O(\Z_OBUF[1]_inst_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Z_OBUF[1]_inst_i_4 
       (.I0(S_IBUF[12]),
        .I1(S_IBUF[13]),
        .O(\Z_OBUF[1]_inst_i_4_n_0 ));
  OBUF \Z_OBUF[2]_inst 
       (.I(Z_OBUF[2]),
        .O(Z[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \Z_OBUF[2]_inst_i_1 
       (.I0(\Z_OBUF[3]_inst_i_2_n_0 ),
        .I1(S_IBUF[7]),
        .I2(S_IBUF[6]),
        .I3(S_IBUF[5]),
        .I4(S_IBUF[4]),
        .I5(\Z_OBUF[2]_inst_i_2_n_0 ),
        .O(Z_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \Z_OBUF[2]_inst_i_2 
       (.I0(S_IBUF[9]),
        .I1(S_IBUF[8]),
        .I2(S_IBUF[11]),
        .I3(S_IBUF[10]),
        .O(\Z_OBUF[2]_inst_i_2_n_0 ));
  OBUF \Z_OBUF[3]_inst 
       (.I(Z_OBUF[3]),
        .O(Z[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \Z_OBUF[3]_inst_i_1 
       (.I0(\Z_OBUF[3]_inst_i_2_n_0 ),
        .I1(S_IBUF[10]),
        .I2(S_IBUF[11]),
        .I3(S_IBUF[8]),
        .I4(S_IBUF[9]),
        .O(Z_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Z_OBUF[3]_inst_i_2 
       (.I0(S_IBUF[13]),
        .I1(S_IBUF[12]),
        .I2(S_IBUF[15]),
        .I3(S_IBUF[14]),
        .O(\Z_OBUF[3]_inst_i_2_n_0 ));
  OBUF r_OBUF_inst
       (.I(r_OBUF),
        .O(r));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFFFF)) 
    r_OBUF_inst_i_1
       (.I0(r_OBUF_inst_i_2_n_0),
        .I1(S_IBUF[1]),
        .I2(S_IBUF[0]),
        .I3(\Z_OBUF[2]_inst_i_2_n_0 ),
        .I4(r_OBUF_inst_i_3_n_0),
        .I5(\Z_OBUF[3]_inst_i_2_n_0 ),
        .O(r_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    r_OBUF_inst_i_2
       (.I0(S_IBUF[2]),
        .I1(S_IBUF[3]),
        .O(r_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    r_OBUF_inst_i_3
       (.I0(S_IBUF[7]),
        .I1(S_IBUF[6]),
        .I2(S_IBUF[5]),
        .I3(S_IBUF[4]),
        .O(r_OBUF_inst_i_3_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
