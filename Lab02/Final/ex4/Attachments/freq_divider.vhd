library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity freq_divider is
    port (
        clk_100mhz, rst: in std_logic;
        pulse_1hz: out std_logic
    );
end freq_divider;

architecture Behavioral of freq_divider is
    constant cnt_max: integer := 100000000;
    signal cnt, cnt_next: integer;
begin
    process (clk_100mhz, rst) is
    begin
        if rst = '1' then
            cnt <= 0;
        elsif clk_100mhz'event and clk_100mhz = '1' then
            cnt <= cnt_next;
        end if;
    end process;
    cnt_next <= 0 when cnt = (cnt_max - 1) else cnt + 1;
    pulse_1hz <= '1' when cnt = (cnt_max - 1) else '0';
end Behavioral;
