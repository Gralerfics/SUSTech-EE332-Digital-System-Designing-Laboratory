// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Feb 28 00:38:13 2023
// Host        : DESKTOP-6BOE7R7 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Workplace/EE332-Digital-System-Designing-Laboratory/Lab02/ex1_full_adder/ex1_full_adder.sim/sim_1/impl/timing/xsim/full_adder_1bit_tb_time_impl.v
// Design      : full_adder_1bit
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "ceffb4c1" *) 
(* NotValidForBitStream *)
module full_adder_1bit
   (A,
    B,
    Cin,
    S,
    Cout,
    S1out,
    S2out,
    S3out);
  input A;
  input B;
  input Cin;
  output S;
  output Cout;
  output S1out;
  output S2out;
  output S3out;

  wire A;
  wire A_IBUF;
  wire B;
  wire B_IBUF;
  wire Cin;
  wire Cin_IBUF;
  wire Cout;
  wire Cout_OBUF;
  wire S;
  wire S1out;
  wire S1out_OBUF;
  wire S2out;
  wire S2out_OBUF;
  wire S3out;
  wire S3out_OBUF;
  wire S_OBUF;

initial begin
 $sdf_annotate("full_adder_1bit_tb_time_impl.sdf",,,,"tool_control");
end
  IBUF A_IBUF_inst
       (.I(A),
        .O(A_IBUF));
  IBUF B_IBUF_inst
       (.I(B),
        .O(B_IBUF));
  IBUF Cin_IBUF_inst
       (.I(Cin),
        .O(Cin_IBUF));
  OBUF Cout_OBUF_inst
       (.I(Cout_OBUF),
        .O(Cout));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    Cout_OBUF_inst_i_1
       (.I0(Cin_IBUF),
        .I1(B_IBUF),
        .I2(A_IBUF),
        .O(Cout_OBUF));
  OBUF S1out_OBUF_inst
       (.I(S1out_OBUF),
        .O(S1out));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    S1out_OBUF_inst_i_1
       (.I0(B_IBUF),
        .I1(A_IBUF),
        .O(S1out_OBUF));
  OBUF S2out_OBUF_inst
       (.I(S2out_OBUF),
        .O(S2out));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h28)) 
    S2out_OBUF_inst_i_1
       (.I0(Cin_IBUF),
        .I1(A_IBUF),
        .I2(B_IBUF),
        .O(S2out_OBUF));
  OBUF S3out_OBUF_inst
       (.I(S3out_OBUF),
        .O(S3out));
  LUT2 #(
    .INIT(4'h8)) 
    S3out_OBUF_inst_i_1
       (.I0(A_IBUF),
        .I1(B_IBUF),
        .O(S3out_OBUF));
  OBUF S_OBUF_inst
       (.I(S_OBUF),
        .O(S));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h96)) 
    S_OBUF_inst_i_1
       (.I0(Cin_IBUF),
        .I1(A_IBUF),
        .I2(B_IBUF),
        .O(S_OBUF));
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
