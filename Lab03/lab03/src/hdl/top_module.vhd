library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

use work.types.all;

entity top_module is
    port (
        clk_sys, rst: in std_logic;
        data_in: in std_logic_vector(15 downto 0);
        anodes_n: out std_logic_vector(7 downto 0);
        segs_n: out std_logic_vector(0 to 7)
    );
end entity;


architecture Behavioral of top_module is
    component seven_segments_display_driver is
        port (
            clk_sys, rst: in std_logic;
            nums: in bcd_array_t(7 downto 0);
            anodes_n: out std_logic_vector(7 downto 0);
            segs_n: out std_logic_vector(0 to 7)
        );
    end component;

    signal num_in: bcd_array_t(7 downto 0);
    signal A, B, C, D: bcd_t;
begin
    seven_segs_driver: seven_segments_display_driver
        port map (
            clk_sys => clk_sys,
            rst => rst,
            nums => num_in,
            anodes_n => anodes_n,
            segs_n => segs_n
        );

    A <= data_in(15 downto 12);
    B <= data_in(11 downto 8);
    C <= data_in(7 downto 4);
    D <= data_in(3 downto 0);

    num_in(7) <= A;
    num_in(6) <= B;
    num_in(5) <= C;
    num_in(4) <= D;

    num_in(3) <= A + B;
    num_in(2) <= A - B;
    num_in(1) <= C + D;
    num_in(0) <= C - D;
end architecture;
