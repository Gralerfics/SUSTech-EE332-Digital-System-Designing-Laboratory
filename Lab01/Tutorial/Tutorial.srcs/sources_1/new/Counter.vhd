----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/13 02:02:21
-- Design Name: 
-- Module Name: Counter - Behavioral
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

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
    Port (
        clock: in STD_LOGIC;
        reset: in STD_LOGIC;
        direction: in STD_LOGIC;
        count_out: out STD_LOGIC_VECTOR (3 downto 0)
    );
end Counter;

architecture Behavioral of Counter is
    signal count_in, count_in_next: STD_LOGIC_VECTOR (3 downto 0);
    signal delay, delay_next: STD_LOGIC_VECTOR (24 downto 0);
begin
    process (reset, clock)
    begin
        if reset = '1' then
            delay <= (others => '0');
            count_in <= (others => '0');
        elsif clock = '1' and clock'event then
            delay <= delay_next;
            count_in <= count_in_next;
        end if;
    end process;
    
    delay_next <= delay + 1;
    count_in_next <= count_in + 1 when delay = 0 and direction = '1' else
                     count_in - 1 when delay = 0 and direction = '0' else
                     count_in;
    count_out <= count_in;
end Behavioral;
