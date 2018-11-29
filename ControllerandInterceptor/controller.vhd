library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller is
    port(
        i_clock     : in    std_logic;
        trigger     : in    std_logic;
        power       : in    std_logic;
        fan         : in    std_logic;
        door_en     : in    std_logic;
        camera_en   : in    std_logic;
        mask        : out   std_logic
        );
end controller;


architecture main of controller is
    signal  bitmask : std_logic_vector(3 downto 0);
    signal  p_bit   : bit;
    signal  f_bit   : bit;
    signal  d_bit   : bit;
    signal  c_bit   : bit;
    signal  state   : std_logic_vector(2 downto 0);
begin
    f_bit   <=  to_bit(fan);
    d_bit   <=  to_bit(door_en);
    c_bit   <=  to_bit(camera_en);
    p_bit   <=  to_bit(power);
    bitmask <= to_stdlogicvector(p_bit & f_bit & d_bit & c_bit);
    
    process (i_clock)
    begin
        if (trigger = '1') and (power = '1') then
            state <= "001";
        end if;
    
        if rising_edge(i_clock) then
            if (state = "001") then
                mask    <= bitmask(3);
                state   <= "010";
            elsif (state = "010") then
                mask    <= bitmask(2);
                state   <= "011";
            elsif (state = "011") then
                mask    <= bitmask(1);
                state   <= "100";
            elsif (state = "100") then
                mask    <= bitmask(0);
                state   <= "101";
            else
                mask    <= '0';
                state   <= "110";
            end if;
        end if;
    
    end process;
end main;

