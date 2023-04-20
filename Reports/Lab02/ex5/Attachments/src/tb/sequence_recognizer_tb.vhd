library IEEE;
use IEEE.std_logic_1164.all;


entity sequence_recognizer_tb is
end entity;


architecture Behavioral of sequence_recognizer_tb is
    component sequence_recognizer is
        port (
            clk, rst: in std_logic;
            data: in std_logic;
            match: out std_logic
        );
    end component;

    signal clk, rst, data, match: std_logic;
    signal data_in_arr: std_logic_vector(0 to 12) := "0000110010101";
begin
    uut: sequence_recognizer port map (
        clk => clk,
        rst => rst,
        data => data,
        match => match
    );

    process is
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    process is
    begin
        wait for 3 ns;
        for i in 0 to 12 loop
            data <= data_in_arr(i);
            wait for 20 ns;
        end loop;
        wait;
    end process;

    rst <= '1', '0' after 25 ns;
end architecture;
