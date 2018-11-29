library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller_tb is
end controller_tb;

architecture behave of controller_tb is

    constant c_CLOCK_PERIOD : time := 40 ns;

    signal r_SIG1   : std_logic := '0';
    signal r_SIG2   : std_logic := '0';
    signal r_SIG3   : std_logic := '0';
    signal r_SIG4   : std_logic := '0';
    signal r_CLOCK  : std_logic := '0';
    signal r_TRIGGER: std_logic := '0';
    signal w_RESULT : std_logic;
    
    component controller is
        port(
        i_clock     : in    std_logic;
        trigger     : in    std_logic;
        power       : in    std_logic;
        fan         : in    std_logic;
        door_en     : in    std_logic;
        camera_en   : in    std_logic;
        mask        : out   std_logic
        );
    end component controller;
    
begin

    controller_INST :   controller
        port map (
            power       => r_SIG1,
            fan         => r_SIG2,
            door_en     => r_SIG3,
            camera_en   => r_SIG4,
            i_clock     => r_CLOCK,
            trigger     => r_TRIGGER,
            mask        => w_RESULT
        );

    p_CLK_GEN : process is
    begin
        wait for c_CLOCK_PERIOD/2;
        r_CLOCK <= not r_CLOCK;
        end process p_CLK_GEN;
        
    
    process
    begin
        r_SIG1      <= '1';
        r_SIG2      <= '0';
        r_SIG3      <= '0';
        r_SIG4      <= '1';
        
        wait for c_CLOCK_PERIOD*4;
        r_TRIGGER   <= '1';
        wait for c_CLOCK_PERIOD/2;
        r_TRIGGER   <= '0';
        wait for c_CLOCK_PERIOD*8;
        
        r_SIG1      <= '1';
        r_SIG2      <= '1';
        r_SIG3      <= '1';
        r_SIG4      <= '0';
        
        wait for c_CLOCK_PERIOD/2;
        r_TRIGGER   <= '1';
        wait for c_CLOCK_PERIOD/2;
        r_TRIGGER   <= '0';
        wait for c_CLOCK_PERIOD*8;
        
        r_SIG1      <= '1';
        r_SIG2      <= '0';
        r_SIG3      <= '1';
        r_SIG4      <= '1';
        
        wait for c_CLOCK_PERIOD/2;
        r_TRIGGER   <= '1';
        wait for c_CLOCK_PERIOD/2;
        r_TRIGGER   <= '0';
        wait for c_CLOCK_PERIOD*8-c_CLOCK_PERIOD/2;
        
    end process;
end behave;