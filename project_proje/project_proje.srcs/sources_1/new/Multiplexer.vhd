-- Written by Atahan Iyiekici--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Muxx is
    Port (select_for_mux: in std_logic_vector(1 downto 0);
          mux_out : out integer;
          distance1 : inout integer;
          distance2 : inout integer );
end Muxx;

architecture Behavioral of Muxx is
signal result : integer;
begin
process(select_for_mux,distance1,distance2)                                   
begin                                                       
    case select_for_mux is
        when "00" => result <= integer(distance1) rem 10 ;                                  -- first digit of distance from sensor1
        when "01" => result <= (integer(distance1) - (integer(distance1) rem 10)) / 10 ;    --second digit of distance from sensor1
        when "10" => result <= integer(distance2) rem 10;                                   -- first digit of distance from sensor2
        when others => result <= (integer(distance2) - (integer(distance2) rem 10))/ 10;    --second digit of distance from sensor2
        end case;
end process;
mux_out <= result; 
end Behavioral;