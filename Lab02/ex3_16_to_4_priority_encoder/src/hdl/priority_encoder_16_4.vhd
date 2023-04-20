library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder_16_4 is
	port (
		S: in std_logic_vector(15 downto 0);
		Z: out std_logic_vector(3 downto 0);
		r: out std_logic
	);
end priority_encoder_16_4;

architecture Structure of priority_encoder_16_4 is
	component priority_encoder_4_2 is
		port (
			S: in std_logic_vector(3 downto 0);
			Z: out std_logic_vector(1 downto 0);
			r: out std_logic
		);
	end component priority_encoder_4_2;
	
	signal r_inter: std_logic_vector(3 downto 0);
	
	type arrtype is array (3 downto 0) of std_logic_vector(1 downto 0);
	signal z_inter: arrtype;
	signal z_high2: std_logic_vector(1 downto 0);
begin
	pri_enc_gen: for i in 0 to 3 generate
		pri_enc: priority_encoder_4_2
			port map (
				S => S(4 * i + 3 downto 4 * i),
				Z => z_inter(i),
				r => r_inter(i)
			);
	end generate;
	
	pri_enc_r: priority_encoder_4_2
		port map (
			S => r_inter,
			Z => z_high2,
			r => r
		);
	
	Z(3 downto 2) <= z_high2;
	with z_high2 select
		Z(1 downto 0) <= z_inter(3) when "11",
						 z_inter(2) when "10",
						 z_inter(1) when "01",
						 z_inter(0) when others;
end Structure;

architecture Behavioral of priority_encoder_16_4 is
begin
	Z <= "1111" when S(15) = '1' else
		 "1110" when S(14) = '1' else
		 "1101" when S(13) = '1' else
		 "1100" when S(12) = '1' else
		 "1011" when S(11) = '1' else
		 "1010" when S(10) = '1' else
		 "1001" when S(9) = '1' else
		 "1000" when S(8) = '1' else
		 "0111" when S(7) = '1' else
		 "0110" when S(6) = '1' else
		 "0101" when S(5) = '1' else
		 "0100" when S(4) = '1' else
		 "0011" when S(3) = '1' else
		 "0010" when S(2) = '1' else
		 "0001" when S(1) = '1' else
		 "0000";
	r <= ((((S(15)) or (S(14))) or ((S(13)) or (S(12)))) or (((S(11)) or (S(10))) or ((S(9)) or (S(8))))) or ((((S(7)) or (S(6))) or ((S(5)) or (S(4)))) or (((S(3)) or (S(2))) or ((S(1)) or (S(0)))));
end Behavioral;
