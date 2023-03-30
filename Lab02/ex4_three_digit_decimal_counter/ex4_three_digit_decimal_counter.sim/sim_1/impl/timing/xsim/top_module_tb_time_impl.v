// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed Mar 29 00:59:24 2023
// Host        : DESKTOP-6BOE7R7 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Workplace/SUSTech-EE332-Digital-System-Designing-Laboratory/Lab02/ex4_three_digit_decimal_counter/ex4_three_digit_decimal_counter.sim/sim_1/impl/timing/xsim/top_module_tb_time_impl.v
// Design      : top_module
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module freq_divider
   (pulse_en,
    E,
    CLK,
    AR,
    load_led_OBUF);
  output pulse_en;
  output [0:0]E;
  input CLK;
  input [0:0]AR;
  input load_led_OBUF;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire cnt_next;
  wire load_led_OBUF;
  wire pulse_en;

  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(pulse_en),
        .O(cnt_next));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(cnt_next),
        .Q(pulse_en));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r1[3]_i_1 
       (.I0(pulse_en),
        .I1(load_led_OBUF),
        .O(E));
endmodule

module three_digit_decimal_counter
   (cathodes_OBUF,
    data_in_IBUF,
    load_led_OBUF,
    pulse_en,
    scan_cnt,
    count_mode_led_OBUF,
    E,
    CLK,
    AR);
  output [6:0]cathodes_OBUF;
  input [11:0]data_in_IBUF;
  input load_led_OBUF;
  input pulse_en;
  input [1:0]scan_cnt;
  input count_mode_led_OBUF;
  input [0:0]E;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire [3:0]bcd1;
  wire [3:0]bcd10;
  wire [3:0]bcd100;
  wire [6:0]cathodes_OBUF;
  wire count_mode_led_OBUF;
  wire [11:0]data_in_IBUF;
  wire eqOp3_in;
  wire load_led_OBUF;
  wire pulse_en;
  wire \r100[1]_i_2_n_0 ;
  wire \r100[2]_i_2_n_0 ;
  wire \r100[2]_i_3_n_0 ;
  wire \r100[3]_i_1_n_0 ;
  wire \r100[3]_i_5_n_0 ;
  wire \r100[3]_i_7_n_0 ;
  wire [3:0]r100_next;
  wire r100_next0__0;
  wire r100_next15_out__3;
  wire r100_next17_out__4;
  wire r100_next1__0;
  wire \r10[1]_i_2_n_0 ;
  wire \r10[2]_i_2_n_0 ;
  wire \r10[2]_i_3_n_0 ;
  wire \r10[3]_i_1_n_0 ;
  wire \r10[3]_i_5_n_0 ;
  wire [3:0]r10_next;
  wire r10_next1__3;
  wire \r1[0]_i_2_n_0 ;
  wire \r1[1]_i_2_n_0 ;
  wire \r1[2]_i_2_n_0 ;
  wire \r1[3]_i_3_n_0 ;
  wire [3:0]r1_next;
  wire [1:0]scan_cnt;
  wire [1:7]seg1;
  wire [1:7]seg10;
  wire [1:7]segs_n;

  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \cathodes_OBUF[1]_inst_i_1 
       (.I0(seg10[1]),
        .I1(segs_n[1]),
        .I2(scan_cnt[1]),
        .I3(seg1[1]),
        .I4(scan_cnt[0]),
        .O(cathodes_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0014)) 
    \cathodes_OBUF[1]_inst_i_2 
       (.I0(bcd10[1]),
        .I1(bcd10[0]),
        .I2(bcd10[2]),
        .I3(bcd10[3]),
        .O(seg10[1]));
  LUT4 #(
    .INIT(16'h0014)) 
    \cathodes_OBUF[1]_inst_i_3 
       (.I0(bcd100[1]),
        .I1(bcd100[0]),
        .I2(bcd100[2]),
        .I3(bcd100[3]),
        .O(segs_n[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0014)) 
    \cathodes_OBUF[1]_inst_i_4 
       (.I0(bcd1[1]),
        .I1(bcd1[0]),
        .I2(bcd1[2]),
        .I3(bcd1[3]),
        .O(seg1[1]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \cathodes_OBUF[2]_inst_i_1 
       (.I0(seg10[2]),
        .I1(segs_n[2]),
        .I2(scan_cnt[1]),
        .I3(seg1[2]),
        .I4(scan_cnt[0]),
        .O(cathodes_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0060)) 
    \cathodes_OBUF[2]_inst_i_2 
       (.I0(bcd10[1]),
        .I1(bcd10[0]),
        .I2(bcd10[2]),
        .I3(bcd10[3]),
        .O(seg10[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0060)) 
    \cathodes_OBUF[2]_inst_i_3 
       (.I0(bcd100[1]),
        .I1(bcd100[0]),
        .I2(bcd100[2]),
        .I3(bcd100[3]),
        .O(segs_n[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0060)) 
    \cathodes_OBUF[2]_inst_i_4 
       (.I0(bcd1[1]),
        .I1(bcd1[0]),
        .I2(bcd1[2]),
        .I3(bcd1[3]),
        .O(seg1[2]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \cathodes_OBUF[3]_inst_i_1 
       (.I0(seg10[3]),
        .I1(segs_n[3]),
        .I2(scan_cnt[1]),
        .I3(seg1[3]),
        .I4(scan_cnt[0]),
        .O(cathodes_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \cathodes_OBUF[3]_inst_i_2 
       (.I0(bcd10[3]),
        .I1(bcd10[2]),
        .I2(bcd10[1]),
        .I3(bcd10[0]),
        .O(seg10[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \cathodes_OBUF[3]_inst_i_3 
       (.I0(bcd100[3]),
        .I1(bcd100[2]),
        .I2(bcd100[1]),
        .I3(bcd100[0]),
        .O(segs_n[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \cathodes_OBUF[3]_inst_i_4 
       (.I0(bcd1[3]),
        .I1(bcd1[2]),
        .I2(bcd1[1]),
        .I3(bcd1[0]),
        .O(seg1[3]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \cathodes_OBUF[4]_inst_i_1 
       (.I0(seg10[4]),
        .I1(segs_n[4]),
        .I2(scan_cnt[1]),
        .I3(seg1[4]),
        .I4(scan_cnt[0]),
        .O(cathodes_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0094)) 
    \cathodes_OBUF[4]_inst_i_2 
       (.I0(bcd10[1]),
        .I1(bcd10[2]),
        .I2(bcd10[0]),
        .I3(bcd10[3]),
        .O(seg10[4]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0094)) 
    \cathodes_OBUF[4]_inst_i_3 
       (.I0(bcd100[1]),
        .I1(bcd100[2]),
        .I2(bcd100[0]),
        .I3(bcd100[3]),
        .O(segs_n[4]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0094)) 
    \cathodes_OBUF[4]_inst_i_4 
       (.I0(bcd1[1]),
        .I1(bcd1[2]),
        .I2(bcd1[0]),
        .I3(bcd1[3]),
        .O(seg1[4]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \cathodes_OBUF[5]_inst_i_1 
       (.I0(seg10[5]),
        .I1(segs_n[5]),
        .I2(scan_cnt[1]),
        .I3(seg1[5]),
        .I4(scan_cnt[0]),
        .O(cathodes_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFEAE)) 
    \cathodes_OBUF[5]_inst_i_2 
       (.I0(bcd10[0]),
        .I1(bcd10[2]),
        .I2(bcd10[1]),
        .I3(bcd10[3]),
        .O(seg10[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFEAE)) 
    \cathodes_OBUF[5]_inst_i_3 
       (.I0(bcd100[0]),
        .I1(bcd100[2]),
        .I2(bcd100[1]),
        .I3(bcd100[3]),
        .O(segs_n[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hFEAE)) 
    \cathodes_OBUF[5]_inst_i_4 
       (.I0(bcd1[0]),
        .I1(bcd1[2]),
        .I2(bcd1[1]),
        .I3(bcd1[3]),
        .O(seg1[5]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \cathodes_OBUF[6]_inst_i_1 
       (.I0(seg10[6]),
        .I1(segs_n[6]),
        .I2(scan_cnt[1]),
        .I3(seg1[6]),
        .I4(scan_cnt[0]),
        .O(cathodes_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h008E)) 
    \cathodes_OBUF[6]_inst_i_2 
       (.I0(bcd10[0]),
        .I1(bcd10[1]),
        .I2(bcd10[2]),
        .I3(bcd10[3]),
        .O(seg10[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h008E)) 
    \cathodes_OBUF[6]_inst_i_3 
       (.I0(bcd100[0]),
        .I1(bcd100[1]),
        .I2(bcd100[2]),
        .I3(bcd100[3]),
        .O(segs_n[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h008E)) 
    \cathodes_OBUF[6]_inst_i_4 
       (.I0(bcd1[0]),
        .I1(bcd1[1]),
        .I2(bcd1[2]),
        .I3(bcd1[3]),
        .O(seg1[6]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \cathodes_OBUF[7]_inst_i_1 
       (.I0(seg10[7]),
        .I1(segs_n[7]),
        .I2(scan_cnt[1]),
        .I3(seg1[7]),
        .I4(scan_cnt[0]),
        .O(cathodes_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0091)) 
    \cathodes_OBUF[7]_inst_i_2 
       (.I0(bcd10[2]),
        .I1(bcd10[1]),
        .I2(bcd10[0]),
        .I3(bcd10[3]),
        .O(seg10[7]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0091)) 
    \cathodes_OBUF[7]_inst_i_3 
       (.I0(bcd100[2]),
        .I1(bcd100[1]),
        .I2(bcd100[0]),
        .I3(bcd100[3]),
        .O(segs_n[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0091)) 
    \cathodes_OBUF[7]_inst_i_4 
       (.I0(bcd1[2]),
        .I1(bcd1[1]),
        .I2(bcd1[0]),
        .I3(bcd1[3]),
        .O(seg1[7]));
  LUT5 #(
    .INIT(32'h8888BB8B)) 
    \r100[0]_i_1 
       (.I0(data_in_IBUF[8]),
        .I1(load_led_OBUF),
        .I2(bcd100[0]),
        .I3(r100_next15_out__3),
        .I4(r100_next17_out__4),
        .O(r100_next[0]));
  LUT6 #(
    .INIT(64'h888888888888B88B)) 
    \r100[1]_i_1 
       (.I0(data_in_IBUF[9]),
        .I1(load_led_OBUF),
        .I2(bcd100[0]),
        .I3(\r100[1]_i_2_n_0 ),
        .I4(r100_next15_out__3),
        .I5(r100_next17_out__4),
        .O(r100_next[1]));
  LUT6 #(
    .INIT(64'hAAA6AAAAAAAAAAAA)) 
    \r100[1]_i_2 
       (.I0(bcd100[1]),
        .I1(r10_next1__3),
        .I2(bcd10[2]),
        .I3(bcd10[1]),
        .I4(bcd10[3]),
        .I5(bcd10[0]),
        .O(\r100[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88888888888B8B88)) 
    \r100[2]_i_1 
       (.I0(data_in_IBUF[10]),
        .I1(load_led_OBUF),
        .I2(r100_next15_out__3),
        .I3(\r100[2]_i_2_n_0 ),
        .I4(\r100[2]_i_3_n_0 ),
        .I5(r100_next17_out__4),
        .O(r100_next[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hD540)) 
    \r100[2]_i_2 
       (.I0(bcd100[1]),
        .I1(r10_next1__3),
        .I2(eqOp3_in),
        .I3(bcd100[0]),
        .O(\r100[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \r100[2]_i_3 
       (.I0(bcd100[1]),
        .I1(bcd100[2]),
        .O(\r100[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \r100[3]_i_1 
       (.I0(load_led_OBUF),
        .I1(r100_next17_out__4),
        .I2(r100_next1__0),
        .I3(r100_next0__0),
        .I4(r100_next15_out__3),
        .I5(pulse_en),
        .O(\r100[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8888BBB8)) 
    \r100[3]_i_2 
       (.I0(data_in_IBUF[11]),
        .I1(load_led_OBUF),
        .I2(\r100[3]_i_5_n_0 ),
        .I3(r100_next15_out__3),
        .I4(r100_next17_out__4),
        .O(r100_next[3]));
  LUT6 #(
    .INIT(64'h0200000000000000)) 
    \r100[3]_i_3 
       (.I0(eqOp3_in),
        .I1(bcd100[1]),
        .I2(bcd100[2]),
        .I3(bcd100[0]),
        .I4(bcd100[3]),
        .I5(r10_next1__3),
        .O(r100_next17_out__4));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \r100[3]_i_4 
       (.I0(\r100[3]_i_7_n_0 ),
        .I1(bcd100[3]),
        .I2(bcd100[2]),
        .I3(bcd100[0]),
        .I4(bcd100[1]),
        .I5(\r1[0]_i_2_n_0 ),
        .O(r100_next15_out__3));
  LUT6 #(
    .INIT(64'h7FFF8000FFF80007)) 
    \r100[3]_i_5 
       (.I0(r10_next1__3),
        .I1(eqOp3_in),
        .I2(bcd100[0]),
        .I3(bcd100[1]),
        .I4(bcd100[3]),
        .I5(bcd100[2]),
        .O(\r100[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \r100[3]_i_6 
       (.I0(bcd10[2]),
        .I1(bcd10[1]),
        .I2(bcd10[3]),
        .I3(bcd10[0]),
        .O(eqOp3_in));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \r100[3]_i_7 
       (.I0(bcd10[3]),
        .I1(bcd10[2]),
        .I2(bcd10[1]),
        .I3(bcd10[0]),
        .O(\r100[3]_i_7_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \r100_reg[0] 
       (.C(CLK),
        .CE(\r100[3]_i_1_n_0 ),
        .CLR(AR),
        .D(r100_next[0]),
        .Q(bcd100[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r100_reg[1] 
       (.C(CLK),
        .CE(\r100[3]_i_1_n_0 ),
        .CLR(AR),
        .D(r100_next[1]),
        .Q(bcd100[1]));
  FDCE #(
    .INIT(1'b0)) 
    \r100_reg[2] 
       (.C(CLK),
        .CE(\r100[3]_i_1_n_0 ),
        .CLR(AR),
        .D(r100_next[2]),
        .Q(bcd100[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r100_reg[3] 
       (.C(CLK),
        .CE(\r100[3]_i_1_n_0 ),
        .CLR(AR),
        .D(r100_next[3]),
        .Q(bcd100[3]));
  LUT5 #(
    .INIT(32'h8888BB8B)) 
    \r10[0]_i_1 
       (.I0(data_in_IBUF[4]),
        .I1(load_led_OBUF),
        .I2(bcd10[0]),
        .I3(r100_next0__0),
        .I4(r100_next1__0),
        .O(r10_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r10[1]_i_1 
       (.I0(data_in_IBUF[5]),
        .I1(load_led_OBUF),
        .I2(\r10[1]_i_2_n_0 ),
        .O(r10_next[1]));
  LUT6 #(
    .INIT(64'h33C033CCCC33CC31)) 
    \r10[1]_i_2 
       (.I0(\r1[0]_i_2_n_0 ),
        .I1(r10_next1__3),
        .I2(bcd10[2]),
        .I3(bcd10[1]),
        .I4(bcd10[3]),
        .I5(bcd10[0]),
        .O(\r10[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88888888888B8B88)) 
    \r10[2]_i_1 
       (.I0(data_in_IBUF[6]),
        .I1(load_led_OBUF),
        .I2(r100_next0__0),
        .I3(\r10[2]_i_2_n_0 ),
        .I4(\r10[2]_i_3_n_0 ),
        .I5(r100_next1__0),
        .O(r10_next[2]));
  LUT3 #(
    .INIT(8'hD4)) 
    \r10[2]_i_2 
       (.I0(bcd10[1]),
        .I1(r10_next1__3),
        .I2(bcd10[0]),
        .O(\r10[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \r10[2]_i_3 
       (.I0(bcd10[1]),
        .I1(bcd10[2]),
        .O(\r10[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \r10[3]_i_1 
       (.I0(load_led_OBUF),
        .I1(r100_next1__0),
        .I2(r10_next1__3),
        .I3(\r1[0]_i_2_n_0 ),
        .I4(r100_next0__0),
        .I5(pulse_en),
        .O(\r10[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r10[3]_i_2 
       (.I0(data_in_IBUF[7]),
        .I1(load_led_OBUF),
        .I2(\r10[3]_i_5_n_0 ),
        .O(r10_next[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00080000)) 
    \r10[3]_i_3 
       (.I0(bcd10[0]),
        .I1(bcd10[3]),
        .I2(bcd10[1]),
        .I3(bcd10[2]),
        .I4(r10_next1__3),
        .O(r100_next1__0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \r10[3]_i_4 
       (.I0(bcd10[0]),
        .I1(bcd10[1]),
        .I2(bcd10[2]),
        .I3(bcd10[3]),
        .I4(\r1[0]_i_2_n_0 ),
        .O(r100_next0__0));
  LUT6 #(
    .INIT(64'h3FF3C000FFFC000B)) 
    \r10[3]_i_5 
       (.I0(\r1[0]_i_2_n_0 ),
        .I1(r10_next1__3),
        .I2(bcd10[2]),
        .I3(bcd10[1]),
        .I4(bcd10[3]),
        .I5(bcd10[0]),
        .O(\r10[3]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \r10_reg[0] 
       (.C(CLK),
        .CE(\r10[3]_i_1_n_0 ),
        .CLR(AR),
        .D(r10_next[0]),
        .Q(bcd10[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r10_reg[1] 
       (.C(CLK),
        .CE(\r10[3]_i_1_n_0 ),
        .CLR(AR),
        .D(r10_next[1]),
        .Q(bcd10[1]));
  FDCE #(
    .INIT(1'b0)) 
    \r10_reg[2] 
       (.C(CLK),
        .CE(\r10[3]_i_1_n_0 ),
        .CLR(AR),
        .D(r10_next[2]),
        .Q(bcd10[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r10_reg[3] 
       (.C(CLK),
        .CE(\r10[3]_i_1_n_0 ),
        .CLR(AR),
        .D(r10_next[3]),
        .Q(bcd10[3]));
  LUT5 #(
    .INIT(32'h8888BB8B)) 
    \r1[0]_i_1 
       (.I0(data_in_IBUF[0]),
        .I1(load_led_OBUF),
        .I2(bcd1[0]),
        .I3(\r1[0]_i_2_n_0 ),
        .I4(r10_next1__3),
        .O(r1_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \r1[0]_i_2 
       (.I0(bcd1[1]),
        .I1(bcd1[0]),
        .I2(bcd1[2]),
        .I3(bcd1[3]),
        .I4(count_mode_led_OBUF),
        .O(\r1[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \r1[0]_i_3 
       (.I0(count_mode_led_OBUF),
        .I1(bcd1[3]),
        .I2(bcd1[0]),
        .I3(bcd1[2]),
        .I4(bcd1[1]),
        .O(r10_next1__3));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r1[1]_i_1 
       (.I0(data_in_IBUF[1]),
        .I1(load_led_OBUF),
        .I2(\r1[1]_i_2_n_0 ),
        .O(r1_next[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h4A5AA5A4)) 
    \r1[1]_i_2 
       (.I0(bcd1[1]),
        .I1(bcd1[2]),
        .I2(bcd1[0]),
        .I3(bcd1[3]),
        .I4(count_mode_led_OBUF),
        .O(\r1[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \r1[2]_i_1 
       (.I0(data_in_IBUF[2]),
        .I1(load_led_OBUF),
        .I2(\r1[2]_i_2_n_0 ),
        .O(r1_next[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h6C6CC9C8)) 
    \r1[2]_i_2 
       (.I0(bcd1[1]),
        .I1(bcd1[2]),
        .I2(bcd1[0]),
        .I3(bcd1[3]),
        .I4(count_mode_led_OBUF),
        .O(\r1[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r1[3]_i_2 
       (.I0(data_in_IBUF[3]),
        .I1(load_led_OBUF),
        .I2(\r1[3]_i_3_n_0 ),
        .O(r1_next[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h6F80FE01)) 
    \r1[3]_i_3 
       (.I0(bcd1[1]),
        .I1(bcd1[2]),
        .I2(bcd1[0]),
        .I3(bcd1[3]),
        .I4(count_mode_led_OBUF),
        .O(\r1[3]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \r1_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(r1_next[0]),
        .Q(bcd1[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r1_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(r1_next[1]),
        .Q(bcd1[1]));
  FDCE #(
    .INIT(1'b0)) 
    \r1_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(r1_next[2]),
        .Q(bcd1[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r1_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(r1_next[3]),
        .Q(bcd1[3]));
endmodule

(* ECO_CHECKSUM = "36f239ae" *) 
(* NotValidForBitStream *)
module top_module
   (clk_100mhz,
    rst,
    load,
    count_mode,
    data_in,
    load_led,
    count_mode_led,
    an,
    cathodes);
  input clk_100mhz;
  input rst;
  input load;
  input count_mode;
  input [11:0]data_in;
  output load_led;
  output count_mode_led;
  output [7:0]an;
  output [0:7]cathodes;

  wire [7:0]an;
  wire [2:0]an_OBUF;
  wire [0:7]cathodes;
  wire [1:7]cathodes_OBUF;
  wire clk_100mhz;
  wire clk_100mhz_IBUF;
  wire clk_100mhz_IBUF_BUFG;
  wire count_mode;
  wire count_mode_led;
  wire count_mode_led_OBUF;
  wire [11:0]data_in;
  wire [11:0]data_in_IBUF;
  wire \delay_cnt[0]_i_2_n_0 ;
  wire [16:0]delay_cnt_reg;
  wire \delay_cnt_reg[0]_i_1_n_0 ;
  wire \delay_cnt_reg[0]_i_1_n_4 ;
  wire \delay_cnt_reg[0]_i_1_n_5 ;
  wire \delay_cnt_reg[0]_i_1_n_6 ;
  wire \delay_cnt_reg[0]_i_1_n_7 ;
  wire \delay_cnt_reg[12]_i_1_n_0 ;
  wire \delay_cnt_reg[12]_i_1_n_4 ;
  wire \delay_cnt_reg[12]_i_1_n_5 ;
  wire \delay_cnt_reg[12]_i_1_n_6 ;
  wire \delay_cnt_reg[12]_i_1_n_7 ;
  wire \delay_cnt_reg[16]_i_1_n_7 ;
  wire \delay_cnt_reg[4]_i_1_n_0 ;
  wire \delay_cnt_reg[4]_i_1_n_4 ;
  wire \delay_cnt_reg[4]_i_1_n_5 ;
  wire \delay_cnt_reg[4]_i_1_n_6 ;
  wire \delay_cnt_reg[4]_i_1_n_7 ;
  wire \delay_cnt_reg[8]_i_1_n_0 ;
  wire \delay_cnt_reg[8]_i_1_n_4 ;
  wire \delay_cnt_reg[8]_i_1_n_5 ;
  wire \delay_cnt_reg[8]_i_1_n_6 ;
  wire \delay_cnt_reg[8]_i_1_n_7 ;
  wire load;
  wire load_led;
  wire load_led_OBUF;
  wire p_0_in;
  wire pulse_en;
  wire rst;
  wire rst_IBUF;
  wire [1:0]scan_cnt;
  wire \scan_cnt[0]_i_1_n_0 ;
  wire \scan_cnt[1]_i_1_n_0 ;
  wire \scan_cnt[1]_i_2_n_0 ;
  wire \scan_cnt[1]_i_3_n_0 ;
  wire \scan_cnt[1]_i_4_n_0 ;
  wire [2:0]\NLW_delay_cnt_reg[0]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_delay_cnt_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_delay_cnt_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_delay_cnt_reg[16]_i_1_O_UNCONNECTED ;
  wire [2:0]\NLW_delay_cnt_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_delay_cnt_reg[8]_i_1_CO_UNCONNECTED ;

initial begin
 $sdf_annotate("top_module_tb_time_impl.sdf",,,,"tool_control");
end
  OBUF \an_OBUF[0]_inst 
       (.I(an_OBUF[0]),
        .O(an[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \an_OBUF[0]_inst_i_1 
       (.I0(scan_cnt[0]),
        .I1(scan_cnt[1]),
        .O(an_OBUF[0]));
  OBUF \an_OBUF[1]_inst 
       (.I(an_OBUF[1]),
        .O(an[1]));
  LUT2 #(
    .INIT(4'hB)) 
    \an_OBUF[1]_inst_i_1 
       (.I0(scan_cnt[1]),
        .I1(scan_cnt[0]),
        .O(an_OBUF[1]));
  OBUF \an_OBUF[2]_inst 
       (.I(an_OBUF[2]),
        .O(an[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an_OBUF[2]_inst_i_1 
       (.I0(scan_cnt[0]),
        .I1(scan_cnt[1]),
        .O(an_OBUF[2]));
  OBUF \an_OBUF[3]_inst 
       (.I(1'b1),
        .O(an[3]));
  OBUF \an_OBUF[4]_inst 
       (.I(1'b1),
        .O(an[4]));
  OBUF \an_OBUF[5]_inst 
       (.I(1'b1),
        .O(an[5]));
  OBUF \an_OBUF[6]_inst 
       (.I(1'b1),
        .O(an[6]));
  OBUF \an_OBUF[7]_inst 
       (.I(1'b1),
        .O(an[7]));
  OBUF \cathodes_OBUF[0]_inst 
       (.I(1'b1),
        .O(cathodes[0]));
  OBUF \cathodes_OBUF[1]_inst 
       (.I(cathodes_OBUF[1]),
        .O(cathodes[1]));
  OBUF \cathodes_OBUF[2]_inst 
       (.I(cathodes_OBUF[2]),
        .O(cathodes[2]));
  OBUF \cathodes_OBUF[3]_inst 
       (.I(cathodes_OBUF[3]),
        .O(cathodes[3]));
  OBUF \cathodes_OBUF[4]_inst 
       (.I(cathodes_OBUF[4]),
        .O(cathodes[4]));
  OBUF \cathodes_OBUF[5]_inst 
       (.I(cathodes_OBUF[5]),
        .O(cathodes[5]));
  OBUF \cathodes_OBUF[6]_inst 
       (.I(cathodes_OBUF[6]),
        .O(cathodes[6]));
  OBUF \cathodes_OBUF[7]_inst 
       (.I(cathodes_OBUF[7]),
        .O(cathodes[7]));
  BUFG clk_100mhz_IBUF_BUFG_inst
       (.I(clk_100mhz_IBUF),
        .O(clk_100mhz_IBUF_BUFG));
  IBUF clk_100mhz_IBUF_inst
       (.I(clk_100mhz),
        .O(clk_100mhz_IBUF));
  IBUF count_mode_IBUF_inst
       (.I(count_mode),
        .O(count_mode_led_OBUF));
  OBUF count_mode_led_OBUF_inst
       (.I(count_mode_led_OBUF),
        .O(count_mode_led));
  three_digit_decimal_counter counter
       (.AR(rst_IBUF),
        .CLK(clk_100mhz_IBUF_BUFG),
        .E(p_0_in),
        .cathodes_OBUF({cathodes_OBUF[1],cathodes_OBUF[2],cathodes_OBUF[3],cathodes_OBUF[4],cathodes_OBUF[5],cathodes_OBUF[6],cathodes_OBUF[7]}),
        .count_mode_led_OBUF(count_mode_led_OBUF),
        .data_in_IBUF(data_in_IBUF),
        .load_led_OBUF(load_led_OBUF),
        .pulse_en(pulse_en),
        .scan_cnt(scan_cnt));
  IBUF \data_in_IBUF[0]_inst 
       (.I(data_in[0]),
        .O(data_in_IBUF[0]));
  IBUF \data_in_IBUF[10]_inst 
       (.I(data_in[10]),
        .O(data_in_IBUF[10]));
  IBUF \data_in_IBUF[11]_inst 
       (.I(data_in[11]),
        .O(data_in_IBUF[11]));
  IBUF \data_in_IBUF[1]_inst 
       (.I(data_in[1]),
        .O(data_in_IBUF[1]));
  IBUF \data_in_IBUF[2]_inst 
       (.I(data_in[2]),
        .O(data_in_IBUF[2]));
  IBUF \data_in_IBUF[3]_inst 
       (.I(data_in[3]),
        .O(data_in_IBUF[3]));
  IBUF \data_in_IBUF[4]_inst 
       (.I(data_in[4]),
        .O(data_in_IBUF[4]));
  IBUF \data_in_IBUF[5]_inst 
       (.I(data_in[5]),
        .O(data_in_IBUF[5]));
  IBUF \data_in_IBUF[6]_inst 
       (.I(data_in[6]),
        .O(data_in_IBUF[6]));
  IBUF \data_in_IBUF[7]_inst 
       (.I(data_in[7]),
        .O(data_in_IBUF[7]));
  IBUF \data_in_IBUF[8]_inst 
       (.I(data_in[8]),
        .O(data_in_IBUF[8]));
  IBUF \data_in_IBUF[9]_inst 
       (.I(data_in[9]),
        .O(data_in_IBUF[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \delay_cnt[0]_i_2 
       (.I0(delay_cnt_reg[0]),
        .O(\delay_cnt[0]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[0] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[0]_i_1_n_7 ),
        .Q(delay_cnt_reg[0]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \delay_cnt_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\delay_cnt_reg[0]_i_1_n_0 ,\NLW_delay_cnt_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\delay_cnt_reg[0]_i_1_n_4 ,\delay_cnt_reg[0]_i_1_n_5 ,\delay_cnt_reg[0]_i_1_n_6 ,\delay_cnt_reg[0]_i_1_n_7 }),
        .S({delay_cnt_reg[3:1],\delay_cnt[0]_i_2_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[10] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[8]_i_1_n_5 ),
        .Q(delay_cnt_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[11] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[8]_i_1_n_4 ),
        .Q(delay_cnt_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[12] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[12]_i_1_n_7 ),
        .Q(delay_cnt_reg[12]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \delay_cnt_reg[12]_i_1 
       (.CI(\delay_cnt_reg[8]_i_1_n_0 ),
        .CO({\delay_cnt_reg[12]_i_1_n_0 ,\NLW_delay_cnt_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\delay_cnt_reg[12]_i_1_n_4 ,\delay_cnt_reg[12]_i_1_n_5 ,\delay_cnt_reg[12]_i_1_n_6 ,\delay_cnt_reg[12]_i_1_n_7 }),
        .S(delay_cnt_reg[15:12]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[13] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[12]_i_1_n_6 ),
        .Q(delay_cnt_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[14] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[12]_i_1_n_5 ),
        .Q(delay_cnt_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[15] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[12]_i_1_n_4 ),
        .Q(delay_cnt_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[16] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[16]_i_1_n_7 ),
        .Q(delay_cnt_reg[16]));
  CARRY4 \delay_cnt_reg[16]_i_1 
       (.CI(\delay_cnt_reg[12]_i_1_n_0 ),
        .CO(\NLW_delay_cnt_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_delay_cnt_reg[16]_i_1_O_UNCONNECTED [3:1],\delay_cnt_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,delay_cnt_reg[16]}));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[1] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[0]_i_1_n_6 ),
        .Q(delay_cnt_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[2] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[0]_i_1_n_5 ),
        .Q(delay_cnt_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[3] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[0]_i_1_n_4 ),
        .Q(delay_cnt_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[4] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[4]_i_1_n_7 ),
        .Q(delay_cnt_reg[4]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \delay_cnt_reg[4]_i_1 
       (.CI(\delay_cnt_reg[0]_i_1_n_0 ),
        .CO({\delay_cnt_reg[4]_i_1_n_0 ,\NLW_delay_cnt_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\delay_cnt_reg[4]_i_1_n_4 ,\delay_cnt_reg[4]_i_1_n_5 ,\delay_cnt_reg[4]_i_1_n_6 ,\delay_cnt_reg[4]_i_1_n_7 }),
        .S(delay_cnt_reg[7:4]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[5] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[4]_i_1_n_6 ),
        .Q(delay_cnt_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[6] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[4]_i_1_n_5 ),
        .Q(delay_cnt_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[7] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[4]_i_1_n_4 ),
        .Q(delay_cnt_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[8] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[8]_i_1_n_7 ),
        .Q(delay_cnt_reg[8]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \delay_cnt_reg[8]_i_1 
       (.CI(\delay_cnt_reg[4]_i_1_n_0 ),
        .CO({\delay_cnt_reg[8]_i_1_n_0 ,\NLW_delay_cnt_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\delay_cnt_reg[8]_i_1_n_4 ,\delay_cnt_reg[8]_i_1_n_5 ,\delay_cnt_reg[8]_i_1_n_6 ,\delay_cnt_reg[8]_i_1_n_7 }),
        .S(delay_cnt_reg[11:8]));
  FDCE #(
    .INIT(1'b0)) 
    \delay_cnt_reg[9] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\delay_cnt_reg[8]_i_1_n_6 ),
        .Q(delay_cnt_reg[9]));
  freq_divider freq_div
       (.AR(rst_IBUF),
        .CLK(clk_100mhz_IBUF_BUFG),
        .E(p_0_in),
        .load_led_OBUF(load_led_OBUF),
        .pulse_en(pulse_en));
  IBUF load_IBUF_inst
       (.I(load),
        .O(load_led_OBUF));
  OBUF load_led_OBUF_inst
       (.I(load_led_OBUF),
        .O(load_led));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \scan_cnt[0]_i_1 
       (.I0(\scan_cnt[1]_i_2_n_0 ),
        .I1(\scan_cnt[1]_i_3_n_0 ),
        .I2(\scan_cnt[1]_i_4_n_0 ),
        .I3(scan_cnt[0]),
        .O(\scan_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \scan_cnt[1]_i_1 
       (.I0(\scan_cnt[1]_i_2_n_0 ),
        .I1(\scan_cnt[1]_i_3_n_0 ),
        .I2(\scan_cnt[1]_i_4_n_0 ),
        .I3(scan_cnt[0]),
        .I4(scan_cnt[1]),
        .O(\scan_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \scan_cnt[1]_i_2 
       (.I0(delay_cnt_reg[7]),
        .I1(delay_cnt_reg[8]),
        .I2(delay_cnt_reg[5]),
        .I3(delay_cnt_reg[6]),
        .I4(delay_cnt_reg[10]),
        .I5(delay_cnt_reg[9]),
        .O(\scan_cnt[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \scan_cnt[1]_i_3 
       (.I0(delay_cnt_reg[0]),
        .I1(delay_cnt_reg[1]),
        .I2(delay_cnt_reg[2]),
        .I3(delay_cnt_reg[4]),
        .I4(delay_cnt_reg[3]),
        .O(\scan_cnt[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \scan_cnt[1]_i_4 
       (.I0(delay_cnt_reg[13]),
        .I1(delay_cnt_reg[14]),
        .I2(delay_cnt_reg[11]),
        .I3(delay_cnt_reg[12]),
        .I4(delay_cnt_reg[16]),
        .I5(delay_cnt_reg[15]),
        .O(\scan_cnt[1]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[0] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[0]_i_1_n_0 ),
        .Q(scan_cnt[0]));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[1] 
       (.C(clk_100mhz_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[1]_i_1_n_0 ),
        .Q(scan_cnt[1]));
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
