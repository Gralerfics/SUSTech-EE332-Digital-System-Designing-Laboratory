library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
	port (
		S: in std_logic_vector(15 downto 0);
		Z: out std_logic_vector(3 downto 0);
		r: out std_logic
	);
end top_module;

architecture Behavioral of top_module is
	component priority_encoder_16_4 is
		port (
			S: in std_logic_vector(15 downto 0);
			Z: out std_logic_vector(3 downto 0);
			r: out std_logic
		);
	end component priority_encoder_16_4;
	
--	for pri_enc: priority_encoder_16_4 use entity work.priority_encoder_16_4(Structure);
	for pri_enc: priority_encoder_16_4 use entity work.priority_encoder_16_4(Behavioral);
begin
	pri_enc: priority_encoder_16_4
		port map (
			S => S,
			Z => Z,
			r => r
		);
end Behavioral;
