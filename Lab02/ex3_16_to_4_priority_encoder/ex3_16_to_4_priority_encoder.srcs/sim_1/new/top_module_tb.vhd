library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module_tb is

end top_module_tb;

architecture Behavioral of top_module_tb is
	component top_module is
		port (
			S: in std_logic_vector(15 downto 0);
			Z: out std_logic_vector(3 downto 0);
			r: out std_logic
		);
	end component top_module;
	
	for uut: top_module use entity work.top_module(Behavioral);
	
	signal S: std_logic_vector(15 downto 0);
	signal Z: std_logic_vector(3 downto 0);
	signal r: std_logic;
begin
	uut: top_module
		port map (
			S => S,
			Z => Z,
			r => r
		);
	
	process is
	begin
		S <= (others => '0');
		for i in 0 to 15 loop
			wait for 20 ns;
			S(i) <= '1';
		end loop;
		wait;
	end process;
end Behavioral;
