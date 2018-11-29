library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity my_first_circuit_tb is
end my_first_circuit_tb;

architecture behave of my_first_circuit_tb is
    signal r_SIG1   : std_logic := '0';
    signal r_SIG2   : std_logic := '0';
    signal w_RESULT : std_logic;
    
    component my_first_circuit is
        port(
        on_1        : in    std_logic;
        on_2        : in    std_logic;
        am_i_on     : out   std_logic
        );
    end component my_first_circuit;

begin

    my_first_circuit_INST   :   my_first_circuit
        port map (
            on_1     => r_SIG1,
            on_2     => r_SIG2,
            am_i_on     => w_RESULT
            );
            
    process is
    begin
        r_SIG1 <= '0';
        r_SIG2 <= '0';
        wait for 10 ns;
        r_SIG1 <= '0';
        r_SIG2 <= '1';
        wait for 10 ns;
        r_SIG1 <= '1';
        r_SIG2 <= '0';
        wait for 10 ns;
        r_SIG1 <= '1';
        r_SIG2 <= '1';
        wait for 10 ns;
    end process;
end behave;
