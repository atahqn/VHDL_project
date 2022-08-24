-- Written by Atahan Iyiekici--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD is
    Port ( bcd_in : in integer; 
           bcd_out : out std_logic_vector(6 downto 0));
end BCD;

architecture Behavioral of BCD is
begin
    process(bcd_in)
    begin
    case bcd_in is 
    when 0 => bcd_out <= "1000000";      -- 0    
    when 1 => bcd_out <= "1111001";      -- 1   
    when 2 => bcd_out <= "0100100";      -- 2    
    when 3 => bcd_out <= "0110000";      -- 3    
    when 4 => bcd_out <= "0011001";      -- 4    
    when 5 => bcd_out <= "0010010";      -- 5    
    when 6 => bcd_out <= "0000010";      -- 6  
    when 7 => bcd_out <= "1111000";      -- 7    
    when 8 => bcd_out <= "0000000";      -- 8    
    when others => bcd_out <= "0011000"; -- 9
    end case;
    end process;
end Behavioral;