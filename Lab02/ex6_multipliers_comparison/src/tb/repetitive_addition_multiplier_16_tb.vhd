library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity repetitive_addition_multiplier_16_tb is
end entity;


architecture Behavioral of repetitive_addition_multiplier_16_tb is
    component repetitive_addition_multiplier_16 is
        port (
            clk, reset, start: in std_logic;
            a_in, b_in: in std_logic_vector(15 downto 0);
            ready: out std_logic;
            r: out std_logic_vector(31 downto 0)
        );
    end component;

    signal clk, reset, start: std_logic;
    signal a, b: std_logic_vector(15 downto 0);
    signal ready: std_logic;
    signal r: std_logic_vector(31 downto 0);
begin
    uut: repetitive_addition_multiplier_16
        port map (
            clk => clk,
            reset => reset,
            start => start,
            a_in => a,
            b_in => b,
            ready => ready,
            r => r
        );

    process is
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    reset <= '1', '0' after 55 ns;
    start <= '1';

    process is
    begin
        wait for 55 ns;
        for i in 0 to 255 loop
            a <= std_logic_vector(to_unsigned(i * 256, 16));
            for j in 0 to 255 loop
                b <= std_logic_vector(to_unsigned(j * 256, 16));
                wait until ready = '1';
                wait for 25 ns;
            end loop;
        end loop;
        wait;
    end process;
end architecture;
