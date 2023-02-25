----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/20 06:28:29
-- Design Name: 
-- Module Name: full_adder_1bit_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_1bit_tb is
--  Port ( );
end full_adder_1bit_tb; 

architecture Behavioral of full_adder_1bit_tb is
    component full_adder_1bit is
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Cin : in STD_LOGIC;
            S : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component full_adder_1bit;
    
--    for UUT: full_adder_1bit use entity work.full_adder_1bit(Behavioral);

    signal A_tb, B_tb, Cin_tb: STD_LOGIC;
    signal S_tb, Cout_tb: STD_LOGIC;
begin
    UUT: full_adder_1bit port map(A => A_tb, B => B_tb, Cin => Cin_tb, S => S_tb, Cout => Cout_tb);

    A_tb <= '1', '0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '1' after 40 ns, '0' after 50 ns, '1' after 60 ns, '0' after 70 ns;
    B_tb <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns;
    Cin_tb <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 50 ns, '0' after 60 ns;
end Behavioral;
