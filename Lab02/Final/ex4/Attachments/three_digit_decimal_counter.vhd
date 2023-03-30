library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity three_digit_decimal_counter is
    port (
        clk, rst, count: in std_logic;
        load: in std_logic;                                 -- synchronous load
        countup: in std_logic;
        d100, d10, d1: in std_logic_vector(3 downto 0);     -- data in
        q100, q10, q1: out std_logic_vector(3 downto 0)     -- values of registers
    );
end three_digit_decimal_counter;

architecture Behavioral of three_digit_decimal_counter is
    signal r100, r10, r1: std_logic_vector(3 downto 0);
    signal r100_next, r10_next, r1_next: std_logic_vector(3 downto 0);
begin
    process (clk, rst)
    begin
        if rst = '1' then
            r100 <= "0000";
            r10 <= "0000";
            r1 <= "0000";
        elsif clk'event and clk = '1' then
            r100 <= r100_next;
            r10 <= r10_next;
            r1 <= r1_next;
        end if;
    end process;

    r1_next <= d1           when load = '1' else
               r1           when count = '0' else
               "0000"       when countup = '1' and r1 = 9 else
               "1001"       when countup = '0' and r1 = 0 else
               r1 + 1       when countup = '1' else
               r1 - 1       when countup = '0' else
               r1;

    r10_next <= d10         when load = '1' else
                r10         when count = '0' else
                "0000"      when countup = '1' and r10 = 9 and r1 = 9 else
                "1001"      when countup = '0' and r10 = 0 and r1 = 0 else
                r10 + 1     when countup = '1' and r1 = 9 else
                r10 - 1     when countup = '0' and r1 = 0 else
                r10;

    r100_next <= d100       when load = '1' else
                 r100       when count = '0' else
                 "0000"     when countup = '1' and r100 = 9 and r10 = 9 and r1 = 9 else
                 "1001"     when countup = '0' and r100 = 0 and r10 = 0 and r1 = 0 else
                 r100 + 1   when countup = '1' and r10 = 9 and r1 = 9 else
                 r100 - 1   when countup = '0' and r10 = 0 and r1 = 0 else
                 r100;

    q100 <= r100;
    q10 <= r10;
    q1 <= r1;
end Behavioral;
