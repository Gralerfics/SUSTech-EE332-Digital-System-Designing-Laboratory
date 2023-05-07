library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity pipelined_multiplier_generic_tb is
end entity;


architecture Behavioral of pipelined_multiplier_generic_tb is
    component pipelined_multiplier_generic is
        generic (
            radix: natural := 16
        );
        port (
            clk, rst: in std_logic;
            a, b: in std_logic_vector(radix - 1 downto 0);
            y: out std_logic_vector(radix * 2 - 1 downto 0)
        );
    end component;

    constant RADIX: natural := 16;
    signal clk, rst: std_logic;
    signal a, b: std_logic_vector(RADIX - 1 downto 0);
    signal y: std_logic_vector(RADIX * 2 - 1 downto 0);
begin
    uut: pipelined_multiplier_generic
        generic map (
            radix => RADIX
        )
        port map (
            clk => clk,
            rst => rst,
            a => a,
            b => b,
            y => y
        );
    
    process is
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    rst <= '1', '0' after 60 ns;

    process is
    begin
        wait for 60 ns;
        for i in 0 to 255 loop
            a <= std_logic_vector(to_unsigned(i * 256, 16));
            for j in 0 to 255 loop
                b <= std_logic_vector(to_unsigned(j * 256, 16));
                wait for 20 ns;
            end loop;
        end loop;
        wait;
    end process;
end architecture;
