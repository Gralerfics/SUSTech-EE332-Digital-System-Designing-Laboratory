library IEEE;
use IEEE.std_logic_1164.all;

use work.types.all;


entity step_motor_driver is
    port (
        clk_sys, rst: in std_logic;
        tick_num: in integer;
        clockwise: in std_logic;
        step_table: in step_table_t;
        channels: out std_logic_vector(3 downto 0)
    );
end entity;


architecture Behavioral of step_motor_driver is
    component frequency_divider is
        port (
            clk, rst: in std_logic;
            period: in integer;
            pulse: out std_logic
        );
    end component;

    signal en: std_logic;
    signal cnt, cnt_next: integer;
begin
    freq_div: frequency_divider
        port map (
            clk => clk_sys,
            rst => rst,
            period => tick_num,
            pulse => en
        );

    process (clk_sys, rst) is
    begin
        if rst = '1' then
            cnt <= 0;
        elsif rising_edge(clk_sys) and en = '1' then
            cnt <= cnt_next;
        end if;
    end process;
    cnt_next <= 0 when cnt = step_table'length - 1 else cnt + 1;

    channels <= step_table(cnt) when clockwise = '1' else step_table(cnt)(0) & step_table(cnt)(1) & step_table(cnt)(2) & step_table(cnt)(3);
end architecture;
