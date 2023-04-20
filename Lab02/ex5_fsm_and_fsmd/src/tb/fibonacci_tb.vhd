library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

use work.types.all;


entity fibonacci_tb is
end entity;


architecture Behavioral of fibonacci_tb is
    component fibonacci is
        port (
            clk, rst, en: in std_logic;
            start: in std_logic;
            n_in: in int;
            ready: out std_logic;
            f_out: out int
        );
    end component;

    signal clk, rst, start: std_logic;
    signal n_in: int;
    signal ready: std_logic;
    signal f_out: int;
begin
    uut: fibonacci port map (
        clk => clk,
        rst => rst,
        en => '1',
        start => start,
        n_in => n_in,
        ready => ready,
        f_out => f_out
    );

    process is
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    rst <= '1', '0' after 25 ns;

    start <= '0', '1' after 50 ns;

    n_in <= to_int(5);
end architecture;
