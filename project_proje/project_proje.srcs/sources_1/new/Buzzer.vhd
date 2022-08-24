-- Written by Atahan Iyiekici--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity buzzer is
    Port ( buzzer_in : in std_logic;
           buzzer_reset : in std_logic;
           resett : in std_logic_vector(1 downto 0);
           buzzer_out : out std_logic
             );
end buzzer;

architecture Behavioral of buzzer is

begin
process(buzzer_in,buzzer_reset,resett) begin
if resett = "11" then                       -- buzzer will make noise iff both sensors saw the object
    if buzzer_reset = '0' then
         buzzer_out <= buzzer_in;
    else
         buzzer_out <= '0';
    end if;
else
    buzzer_out <= '0';
end if;
end process;
end Behavioral;
