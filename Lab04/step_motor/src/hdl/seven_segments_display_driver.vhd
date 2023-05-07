library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

use work.types.all;


entity seven_segments_display_driver is
    port (
        clk_sys, rst: in std_logic;
        nums: in bcd_array_t(7 downto 0);
        pts: in std_logic_vector(7 downto 0);
        anodes_n: out std_logic_vector(7 downto 0);
        segs_n: out std_logic_vector(0 to 7)
    );
end entity;


architecture Behavioral of seven_segments_display_driver is
    component frequency_divider is
        port (
            clk, rst: in std_logic;
            period: in integer;
            pulse: out std_logic
        );
    end component;

    component decoder_3_to_8 is
        port (
            addr: in std_logic_vector(2 downto 0);
            data_n: out std_logic_vector(7 downto 0)
        );
    end component;

    component seven_segments_display_decoder is
        port (
            bcd: in std_logic_vector(3 downto 0);
            en_dp: in std_logic;
            segs_n: out std_logic_vector(0 to 7)
        );
    end component;

    signal enable: std_logic;
    signal num_idx, num_idx_next: natural;
begin
    freq_div: frequency_divider
        port map (
            clk => clk_sys,
            rst => rst,
            period => 1000,
            pulse => enable
        );

    process (clk_sys, rst) is
    begin
        if (rst = '1') then
            num_idx <= 0;
        elsif rising_edge(clk_sys) then
            num_idx <= num_idx_next;
        end if;
    end process;
    num_idx_next <= num_idx when enable = '0' else
                    0 when num_idx = 7 else
                    num_idx + 1;

    decoder: decoder_3_to_8
        port map (
            addr => conv_std_logic_vector(num_idx, 3),
            data_n => anodes_n
        );
    
    seven_seg_dec: seven_segments_display_decoder
        port map (
            bcd => nums(num_idx),
            en_dp => pts(num_idx),
            segs_n => segs_n
        );
end architecture;
