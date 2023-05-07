library IEEE;
use IEEE.std_logic_1164.all;

use work.constants.all;
use work.types.all;


entity top_module is
    port (
        clk_sys, rst: in std_logic;
        btn_up_in, btn_down_in: in std_logic;
        clockwise: in std_logic;
        channels: out std_logic_vector(3 downto 0);
        anodes_n: out std_logic_vector(7 downto 0);
        segs_n: out std_logic_vector(0 to 7)
    );
end entity;


architecture Behavioral of top_module is
    component step_motor_driver is
        port (
            clk_sys, rst: in std_logic;
            tick_num: in integer;
            clockwise: in std_logic;
            step_table: in step_table_t;
            channels: out std_logic_vector(3 downto 0)
        );
    end component;

    component seven_segments_display_driver is
        port (
            clk_sys, rst: in std_logic;
            nums: in bcd_array_t(7 downto 0);
            pts: in std_logic_vector(7 downto 0);
            anodes_n: out std_logic_vector(7 downto 0);
            segs_n: out std_logic_vector(0 to 7)
        );
    end component;

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

    component frequency_divider is
        port (
            clk, rst: in std_logic;
            period: in integer;
            pulse: out std_logic
        );
    end component;

    signal btn_up, btn_down: std_logic;
    signal nums: bcd_array_t(7 downto 0);
    signal tick_num, tick_num_next: integer;
    signal pulse: std_logic;
begin
    motor_drv: step_motor_driver
        port map (
            clk_sys => clk_sys,
            rst => rst,
            tick_num => tick_num,
            clockwise => clockwise,
            step_table => STEPTABLE_FULLSTEP,
            channels => channels
        );

    seven_seg_drv: seven_segments_display_driver
        port map (
            clk_sys => clk_sys,
            rst => rst,
            nums => nums,
            pts => (others => '0'),
            anodes_n => anodes_n,
            segs_n => segs_n
        );
    
    btn_up_state: button_state
        generic map (
            PERIOD => 3000
        )
        port map (
            clk => clk_sys,
            rst => rst,
            btn_in => btn_up_in,
            btn_out => btn_up
        );

    btn_down_state: button_state
        generic map (
            PERIOD => 3000
        )
        port map (
            clk => clk_sys,
            rst => rst,
            btn_in => btn_down_in,
            btn_out => btn_down
        );
    
    freq_div_top: frequency_divider
        port map (
            clk => clk_sys,
            rst => rst,
            period => 8000000,
            pulse => pulse
        );
    
    process (clk_sys, rst) is
    begin
        if rst = '1' then
            tick_num <= 1047588;
        elsif rising_edge(clk_sys) and pulse = '1' then
            tick_num <= tick_num_next;
        end if;
    end process;

    tick_num_next <= tick_num - 5000 when btn_down = '1' and tick_num /= 1 else
                     tick_num + 5000 when btn_up = '1' else
                     tick_num;

    nums(7) <= to_bcd(tick_num / 10000000 mod 10);
    nums(6) <= to_bcd(tick_num / 1000000 mod 10);
    nums(5) <= to_bcd(tick_num / 100000 mod 10);
    nums(4) <= to_bcd(tick_num / 10000 mod 10);
    nums(3) <= to_bcd(tick_num / 1000 mod 10);
    nums(2) <= to_bcd(tick_num / 100 mod 10);
    nums(1) <= to_bcd(tick_num / 10 mod 10);
    nums(0) <= to_bcd(tick_num mod 10);
end architecture;
