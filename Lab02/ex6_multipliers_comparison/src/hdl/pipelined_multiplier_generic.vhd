library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity pipelined_multiplier_generic is
    generic (
        radix: natural := 16
    );
    port (
        clk, rst: in std_logic;
        a, b: in std_logic_vector(radix - 1 downto 0);
        y: out std_logic_vector(radix * 2 - 1 downto 0)
    );
end entity;


architecture Behavioral of pipelined_multiplier_generic is
    type ppn_t is array(0 to radix - 1) of std_logic_vector(2 * radix - 1 downto 0);
    type abn_t is array(1 to radix) of std_logic_vector(radix - 1 downto 0);
    type bvn_t is array(0 to radix - 1) of std_logic_vector(radix - 1 downto 0);

    signal ppn_reg, ppn_next: ppn_t;
    signal an_reg, an_next, bn_reg, bn_next: abn_t;
    signal bvn: bvn_t;
begin
    process (clk, rst) is
    begin
        if rst = '1' then
            ppn_reg <= (others => (others => '0'));
            an_reg <= (others => (others => '0'));
            bn_reg <= (others => (others => '0'));
        elsif rising_edge(clk) then
            ppn_reg <= ppn_next;
            an_reg <= an_next;
            bn_reg <= bn_next;
        end if;
    end process;

    -- Stage 0
    bvn(0) <= (others => b(0));
    ppn_next(0) <= std_logic_vector(resize(unsigned(a and bvn(0)), radix * 2));
    an_next(1) <= a;
    bn_next(1) <= b;

    -- Stage 1 ~ radix - 1
    stages: for i in 1 to radix - 1 generate
        bvn(i) <= (others => bn_reg(i)(i));
        ppn_next(i) <= ppn_reg(i - 1) + std_logic_vector(shift_left(resize(unsigned(an_reg(i) and bvn(i)), radix * 2), i));
        an_next(i + 1) <= an_reg(i);
        bn_next(i + 1) <= bn_reg(i);
    end generate;

    -- Output
    y <= std_logic_vector(ppn_reg(radix - 1));
end architecture;
