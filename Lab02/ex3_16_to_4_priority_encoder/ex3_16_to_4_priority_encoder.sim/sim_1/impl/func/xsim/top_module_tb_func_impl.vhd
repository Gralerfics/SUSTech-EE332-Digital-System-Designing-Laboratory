-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Sun Mar 12 22:43:26 2023
-- Host        : DESKTOP-6BOE7R7 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Workplace/SUSTech-EE332-Digital-System-Designing-Laboratory/Lab02/ex3_16_to_4_priority_encoder/ex3_16_to_4_priority_encoder.sim/sim_1/impl/func/xsim/top_module_tb_func_impl.vhd
-- Design      : top_module
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_module is
  port (
    S : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Z : out STD_LOGIC_VECTOR ( 3 downto 0 );
    r : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_module : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of top_module : entity is "47db28f6";
end top_module;

architecture STRUCTURE of top_module is
  signal S_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Z_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \Z_OBUF[0]_inst_i_2_n_0\ : STD_LOGIC;
  signal \Z_OBUF[0]_inst_i_3_n_0\ : STD_LOGIC;
  signal \Z_OBUF[1]_inst_i_2_n_0\ : STD_LOGIC;
  signal \Z_OBUF[1]_inst_i_3_n_0\ : STD_LOGIC;
  signal \Z_OBUF[2]_inst_i_2_n_0\ : STD_LOGIC;
  signal \Z_OBUF[2]_inst_i_3_n_0\ : STD_LOGIC;
  signal \Z_OBUF[3]_inst_i_2_n_0\ : STD_LOGIC;
  signal r_OBUF : STD_LOGIC;
  signal r_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal r_OBUF_inst_i_3_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Z_OBUF[1]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \Z_OBUF[3]_inst_i_1\ : label is "soft_lutpair0";
begin
\S_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(0),
      O => S_IBUF(0)
    );
\S_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(10),
      O => S_IBUF(10)
    );
\S_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(11),
      O => S_IBUF(11)
    );
\S_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(12),
      O => S_IBUF(12)
    );
\S_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(13),
      O => S_IBUF(13)
    );
\S_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(14),
      O => S_IBUF(14)
    );
\S_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(15),
      O => S_IBUF(15)
    );
\S_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(1),
      O => S_IBUF(1)
    );
\S_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(2),
      O => S_IBUF(2)
    );
\S_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(3),
      O => S_IBUF(3)
    );
\S_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(4),
      O => S_IBUF(4)
    );
\S_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(5),
      O => S_IBUF(5)
    );
\S_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(6),
      O => S_IBUF(6)
    );
\S_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(7),
      O => S_IBUF(7)
    );
\S_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(8),
      O => S_IBUF(8)
    );
\S_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(9),
      O => S_IBUF(9)
    );
\Z_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Z_OBUF(0),
      O => Z(0)
    );
\Z_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF5504"
    )
        port map (
      I0 => S_IBUF(14),
      I1 => \Z_OBUF[0]_inst_i_2_n_0\,
      I2 => S_IBUF(12),
      I3 => S_IBUF(13),
      I4 => S_IBUF(15),
      O => Z_OBUF(0)
    );
\Z_OBUF[0]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55550054"
    )
        port map (
      I0 => S_IBUF(10),
      I1 => S_IBUF(7),
      I2 => \Z_OBUF[0]_inst_i_3_n_0\,
      I3 => S_IBUF(8),
      I4 => S_IBUF(9),
      I5 => S_IBUF(11),
      O => \Z_OBUF[0]_inst_i_2_n_0\
    );
\Z_OBUF[0]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BBBBABAA"
    )
        port map (
      I0 => S_IBUF(5),
      I1 => S_IBUF(4),
      I2 => S_IBUF(2),
      I3 => S_IBUF(1),
      I4 => S_IBUF(3),
      I5 => S_IBUF(6),
      O => \Z_OBUF[0]_inst_i_3_n_0\
    );
\Z_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Z_OBUF(1),
      O => Z(1)
    );
\Z_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => S_IBUF(14),
      I1 => \Z_OBUF[1]_inst_i_2_n_0\,
      I2 => S_IBUF(13),
      I3 => S_IBUF(15),
      O => Z_OBUF(1)
    );
\Z_OBUF[1]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFABAA"
    )
        port map (
      I0 => S_IBUF(11),
      I1 => S_IBUF(9),
      I2 => S_IBUF(8),
      I3 => \Z_OBUF[1]_inst_i_3_n_0\,
      I4 => S_IBUF(10),
      I5 => S_IBUF(12),
      O => \Z_OBUF[1]_inst_i_2_n_0\
    );
\Z_OBUF[1]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAFE"
    )
        port map (
      I0 => S_IBUF(6),
      I1 => S_IBUF(3),
      I2 => S_IBUF(2),
      I3 => S_IBUF(4),
      I4 => S_IBUF(5),
      I5 => S_IBUF(7),
      O => \Z_OBUF[1]_inst_i_3_n_0\
    );
\Z_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Z_OBUF(2),
      O => Z(2)
    );
\Z_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \Z_OBUF[2]_inst_i_2_n_0\,
      I1 => S_IBUF(15),
      O => Z_OBUF(2)
    );
\Z_OBUF[2]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAABA"
    )
        port map (
      I0 => S_IBUF(14),
      I1 => S_IBUF(11),
      I2 => \Z_OBUF[2]_inst_i_3_n_0\,
      I3 => S_IBUF(9),
      I4 => S_IBUF(12),
      I5 => S_IBUF(13),
      O => \Z_OBUF[2]_inst_i_2_n_0\
    );
\Z_OBUF[2]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055555554"
    )
        port map (
      I0 => S_IBUF(8),
      I1 => S_IBUF(5),
      I2 => S_IBUF(4),
      I3 => S_IBUF(6),
      I4 => S_IBUF(7),
      I5 => S_IBUF(10),
      O => \Z_OBUF[2]_inst_i_3_n_0\
    );
\Z_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Z_OBUF(3),
      O => Z(3)
    );
\Z_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => S_IBUF(13),
      I1 => \Z_OBUF[3]_inst_i_2_n_0\,
      I2 => S_IBUF(15),
      O => Z_OBUF(3)
    );
\Z_OBUF[3]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => S_IBUF(12),
      I1 => S_IBUF(9),
      I2 => S_IBUF(8),
      I3 => S_IBUF(10),
      I4 => S_IBUF(11),
      I5 => S_IBUF(14),
      O => \Z_OBUF[3]_inst_i_2_n_0\
    );
r_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => r_OBUF,
      O => r
    );
r_OBUF_inst_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => S_IBUF(13),
      I1 => S_IBUF(12),
      I2 => r_OBUF_inst_i_2_n_0,
      I3 => S_IBUF(11),
      I4 => S_IBUF(14),
      I5 => S_IBUF(15),
      O => r_OBUF
    );
r_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => S_IBUF(10),
      I1 => S_IBUF(7),
      I2 => r_OBUF_inst_i_3_n_0,
      I3 => S_IBUF(5),
      I4 => S_IBUF(8),
      I5 => S_IBUF(9),
      O => r_OBUF_inst_i_2_n_0
    );
r_OBUF_inst_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => S_IBUF(4),
      I1 => S_IBUF(1),
      I2 => S_IBUF(2),
      I3 => S_IBUF(0),
      I4 => S_IBUF(3),
      I5 => S_IBUF(6),
      O => r_OBUF_inst_i_3_n_0
    );
end STRUCTURE;
