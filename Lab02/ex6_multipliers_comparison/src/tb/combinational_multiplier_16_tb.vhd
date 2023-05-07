library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity combinational_multiplier_16_tb is
end entity;


architecture Behavioral of combinational_multiplier_16_tb is
    component combinational_multiplier_16 is
        port (
            a, b: in std_logic_vector(15 downto 0);
            y: out std_logic_vector(31 downto 0)
        );
    end component;

    signal clk: std_logic;
    signal a, b: std_logic_vector(15 downto 0);
    signal y: std_logic_vector(31 downto 0);
begin
    uut: combinational_multiplier_16 port map(
        a => a,
        b => b,
        y => y
    );

    process is
    begin
        clk <= '0';
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;
    end process;

    process is
    begin
        for i in 0 to 255 loop
            a <= std_logic_vector(to_unsigned(i * 256, 16));
            for j in 0 to 255 loop
                b <= std_logic_vector(to_unsigned(j * 256, 16));
                wait until rising_edge(clk);
            end loop;
        end loop;
        wait;
    end process;
end architecture;
