-- Written by Atahan Iyiekici--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity anode_decoder is
    Port ( anode_cases : in STD_LOGIC_VECTOR (1 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end anode_decoder;

architecture Behavioral of anode_decoder is
begin
process(anode_cases)
    begin
    case anode_cases is
    when "00" => anode <= "1110";
    when "01" => anode <= "1101";
    when "10" => anode <= "1011";
    when "11" => anode <= "0111";
    when OTHERS => anode <= "1111";
    end case;
end process;
end Behavioral;