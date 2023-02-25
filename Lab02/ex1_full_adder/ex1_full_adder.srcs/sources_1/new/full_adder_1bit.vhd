----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/20 06:27:58
-- Design Name: 
-- Module Name: full_adder_1bit - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_1bit is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end full_adder_1bit;

architecture Behavioral of full_adder_1bit is
    signal s1, s2, s3: STD_LOGIC;
    constant gate_propagation_delay: time := 10 ns;
begin
    -- S = (A xor B) xor Cin = s1 xor Cin
    -- Cout = (A and B) or Cin and (A xor B) = s3 or (Cin and s1) = s3 or s2
    s1 <= (A xor B) after gate_propagation_delay;
    s2 <= (Cin and s1) after gate_propagation_delay;
    s3 <= (A and B) after gate_propagation_delay;
    S <= (s1 xor Cin) after gate_propagation_delay;
    Cout <= (s2 or s3) after gate_propagation_delay;
end Behavioral;
