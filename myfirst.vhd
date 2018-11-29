library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity my_first_circuit is
    port(
        on_1        : in    std_logic;
        on_2        : in    std_logic;
        am_i_on     : out   std_logic
    );
end my_first_circuit;

architecture arch of my_first_circuit is
    signal am_i : std_logic;

begin
    am_i    <= on_1 and on_2;
    am_i_on <= am_i;
end arch;
