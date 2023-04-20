library IEEE;
use IEEE.std_logic_1164.all;


entity top_module_tb is
end top_module_tb;


architecture Behavioral of top_module_tb is
    component three_digit_decimal_counter is
        port (
            clk, rst, count: in std_logic;
            load: in std_logic;                                 -- synchronous load
            countup: in std_logic;
            d100, d10, d1: in std_logic_vector(3 downto 0);     -- data in
            q100, q10, q1: out std_logic_vector(3 downto 0)     -- values of registers
        );
    end component;

    component seven_segments_display_decoder is
        port (
            bcd: in std_logic_vector(3 downto 0);
            en_dp: in std_logic;
            segs_n: out std_logic_vector(0 to 7)                -- 0 to 7: dp, a, b, c, d, e, f, g
        );
    end component;

    constant en_dp: std_logic := '0';
    constant cnt_max: integer := 2; -- 100000000;

    signal cnt, cnt_next: integer;

    signal pulse_en: std_logic;
    signal bcd100, bcd10, bcd1: std_logic_vector(3 downto 0);
    signal seg100, seg10, seg1: std_logic_vector(0 to 7);

    signal delay_cnt, delay_cnt_next: integer range 0 to (100000 - 1);
    signal scan_cnt, scan_cnt_next: integer range 0 to 2;

    signal clk_100mhz, rst: std_logic;
    signal load, count_mode: std_logic;
    signal data_in: std_logic_vector(11 downto 0);
    signal load_led, count_mode_led: std_logic;
    signal an: std_logic_vector(7 downto 0);
    signal cathodes: std_logic_vector(0 to 7);
begin
    process (clk_100mhz, rst) is
        begin
            if rst = '1' then
                cnt <= 0;
            elsif clk_100mhz'event and clk_100mhz = '1' then
                cnt <= cnt_next;
            end if;
        end process;

    cnt_next <= 0 when cnt = (cnt_max - 1) else cnt + 1;
    pulse_en <= '1' when cnt = (cnt_max - 1) else '0';

    counter: three_digit_decimal_counter
        port map (
            clk => clk_100mhz,
            rst => rst,
            count => pulse_en,
            load => load,
            countup => count_mode,
            d100 => data_in(11 downto 8),
            d10 => data_in(7 downto 4),
            d1 => data_in(3 downto 0),
            q100 => bcd100,
            q10 => bcd10,
            q1 => bcd1
        );
    load_led <= load;
    count_mode_led <= count_mode;

    seg100_disp: seven_segments_display_decoder port map (bcd => bcd100, en_dp => en_dp, segs_n => seg100);
    seg10_disp: seven_segments_display_decoder port map (bcd => bcd10, en_dp => en_dp, segs_n => seg10);
    seg1_disp: seven_segments_display_decoder port map (bcd => bcd1, en_dp => en_dp, segs_n => seg1);

    process (clk_100mhz, rst) is
    begin
        if rst = '1' then
            delay_cnt <= 0;
            scan_cnt <= 0;
        elsif clk_100mhz'event and clk_100mhz = '1' then
            delay_cnt <= delay_cnt_next;
            scan_cnt <= scan_cnt_next;
        end if;
    end process;

    delay_cnt_next <= delay_cnt + 1;
    scan_cnt_next <= scan_cnt + 1 when delay_cnt = 0 else
                     scan_cnt;

    an(7 downto 3) <= (others => '1');
    an(2) <= '0' when scan_cnt = 2 else '1';
    an(1) <= '0' when scan_cnt = 1 else '1';
    an(0) <= '0' when scan_cnt = 0 else '1';
    cathodes <= seg100 when scan_cnt = 2 else
                seg10 when scan_cnt = 1 else
                seg1;

    process is
    begin
        clk_100mhz <= '0';
        wait for 5 ns;
        clk_100mhz <= '1';
        wait for 5 ns;
    end process;
    rst <= '1', '0' after 50 ns;
    load <= '0', '1' after 700 ns, '0' after 750 ns;
    count_mode <= '1', '0' after 300 ns, '1' after 700 ns;
    data_in <= "100110010110";
end Behavioral;
