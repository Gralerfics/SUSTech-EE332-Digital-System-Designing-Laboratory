library IEEE;
use IEEE.std_logic_1164.all;


entity button_state_tb is
end button_state_tb;


architecture Behavioral of button_state_tb is
    component button_state is
        generic (
            PERIOD: integer := 1000 -- 10 us
        );
        port (
            clk, rst: in std_logic;
            btn_in: in std_logic;
            btn_out: out std_logic
        );
    end component;

    signal clk, rst, btn_in, btn_out: std_logic;
begin
    uut: button_state generic map (PERIOD => 1000) port map (clk, rst, btn_in, btn_out);

    process is
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    rst <= '1', '0' after 30 ns;

    btn_in <= '0', '1' after 1 us, '0' after 5 us, '1' after 10 us, '0' after 12 us, '1' after 30 us, '0' after 33 us, '1' after 41 us, '0' after 100 us, '1' after 110 us, '0' after 114 us;
end architecture;
