-- Written by Atahan Iyiekici--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rangesensor2 is
    Port ( clk : in STD_LOGIC;
           echo2 : in STD_LOGIC;
           to_servo2 : out std_logic;
           trigger2 : out STD_LOGIC;
           distance2: inout integer);
end rangesensor2;
architecture Behavioral of rangesensor2 is
signal distance_signal2: integer;

begin
process(clk)
variable timer11, timer12, echo_time: integer:= 0;
variable data_controll : std_logic := '1';
begin
if rising_edge(clk) then
    if (timer11 = 0) then
        trigger2 <= '1'; 
    elsif (timer11 = 1000) then --this means 10 us 
        trigger2 <= '0';
        data_controll := '1';
    elsif (timer11 = 2400000) then --this means 24 ms-400 cm-max distance  
        timer11 := 0;
        trigger2 <= '1';
    end if;
        timer11 := timer11 + 1;
    if echo2 = '1' then
        timer12 := timer12 + 1;
    elsif echo2 = '0' and data_controll ='1' then
        echo_time := timer12;
        distance_signal2 <= integer((timer12*17)/100000);
        distance2 <= distance_signal2;
        timer12 := 0;
        data_controll := '0';
    end if;  
    if distance_signal2 > 10 and distance_signal2 < 35 then
        to_servo2 <= '1';
    else
        to_servo2 <= '0';
    end if;
end if;
end process;
end Behavioral;