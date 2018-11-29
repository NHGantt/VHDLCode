library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity interceptor_tb is
end interceptor_tb;

architecture behave of interceptor_tb is

    constant c_CLOCK_PERIOD : time := 40 ns;
    
    signal r_DATA   : std_logic := '0';
    signal r_CLOCK  : std_logic := '0';
    signal w_FAN    : std_logic := '0';
    signal w_DOOR   : std_logic := '0';
    signal w_CAM    : std_logic := '0';
    signal w_POW    : std_logic := '0';
    
    component interceptor is
        port(
            i_clock     : in    std_logic;
            dataline    : in    std_logic;
            power_chk   : out   std_logic;
            fan_on      : out   std_logic;
            door_unl    : out   std_logic;
            cam_on      : out   std_logic
            );
    end component interceptor;
    
begin
    
    interceptor_INST : interceptor
        port map(
            i_clock     => r_CLOCK,
            dataline    => r_DATA,
            power_chk   => w_POW,
            fan_on      => w_FAN,
            door_unl    => w_DOOR,
            cam_on      => w_CAM
        );
        
    p_CLK_GEN : process is
    begin
        wait for c_CLOCK_PERIOD/2;
        r_CLOCK <= not r_CLOCK;
        end process p_CLK_GEN;
            
            
    process
    begin
    wait for c_CLOCK_PERIOD*2;
    r_DATA <= '1';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '0';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '0';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '1';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '0';
    wait for c_CLOCK_PERIOD*2;
    
    wait for c_CLOCK_PERIOD*2;
    r_DATA <= '1';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '0';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '1';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '1';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '0';
    wait for c_CLOCK_PERIOD*2;
    
    wait for c_CLOCK_PERIOD*2;
    r_DATA <= '1';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '1';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '1';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '1';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '0';
    wait for c_CLOCK_PERIOD*2;
    
    wait for c_CLOCK_PERIOD*2;
    r_DATA <= '1';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '0';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '0';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '0';
    wait for c_CLOCK_PERIOD;
    r_DATA <= '0';
    wait for c_CLOCK_PERIOD*2;

    end process;
end behave;