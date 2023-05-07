library IEEE;
use IEEE.std_logic_1164.all;


entity frequency_divider is
    port (
        clk, rst: in std_logic;
        period: in integer;
        pulse: out std_logic
    );
end entity;


architecture Behavioral of frequency_divider is
    signal cnt, cnt_next: integer;
begin
    process (clk, rst) is
    begin
        if rst = '1' then
            cnt <= 0;
        elsif rising_edge(clk) then
            cnt <= cnt_next;
        end if;
    end process;
    cnt_next <= 0 when cnt = period - 1 else cnt + 1;
    pulse <= '1' when cnt = period - 1 else '0';
end architecture;
