library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder_4_2 is
	port (
		S: in std_logic_vector(3 downto 0);
		Z: out std_logic_vector(1 downto 0);
		r: out std_logic
	);
end priority_encoder_4_2;

architecture Behavioral of priority_encoder_4_2 is
begin
	Z <= "11" when S(3) = '1' else
		 "10" when S(2) = '1' else
		 "01" when S(1) = '1' else
		 "00";
	r <= (S(3) or S(2)) or (S(1) or S(0));
end Behavioral;
