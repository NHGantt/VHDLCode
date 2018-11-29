library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity interceptor is
    port(
        i_clock     : in    std_logic;
        dataline    : in    std_logic;
        power_chk   : out   std_logic;
        fan_on      : out   std_logic;
        door_unl    : out   std_logic;
        cam_on      : out   std_logic
    );
end interceptor;

architecture main of interceptor is
    signal state    : std_logic_vector(2 downto 0) := "000";
    signal ready    : boolean;
begin

    process (i_clock)
    begin
        if rising_edge(dataline) and (state = "000")    then
            ready       <= true;
            state       <= "001";
        end if;
        
        if rising_edge(i_clock) and ready then
            if (state = "001")      then
                power_chk   <= dataline;
                state       <= "010";
            elsif (state = "010")   then
                fan_on      <= dataline;
                state       <= "011";
            elsif (state = "011")   then
                door_unl    <= dataline;
                state       <= "100";
            elsif (state = "100")   then
                cam_on      <= dataline;
                state       <= "101";
            else
                state       <= "000";
                ready       <= false;
            end if;
        end if;
    end process;
end main;    

