-- Written by Atahan Iyiekici--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rangesensor is
    Port ( clk : in STD_LOGIC;
           echo : in STD_LOGIC;
           to_servo : out std_logic;
           buzzer_trig : out STD_LOGIC;
           trigger : out STD_LOGIC;
           distance1: inout integer);
end rangesensor;
architecture Behavioral of rangesensor is
signal distance_signal: integer;
begin

process(clk)
variable timer1, timer2, echo_timer: integer:= 0; --timer1 for the trigger, timer2 for getting echo signal, echo_timer for make timer2 zero
variable data_controll : std_logic := '1'; -- this variable makes the connection between echo and trigger between calculation part and the trigger generator part
begin
if rising_edge(clk) then
    if (timer1 = 0) then
        trigger <= '1';    
    elsif (timer1 = 1000) then --this means 10 us trigger signal should be given in this time
        trigger <= '0';
        data_controll := '1';
    elsif (timer1 = 2400000) then --maximum distance reached at this point, this means 24 ms for the clock and 400 cm distance   
        timer1 := 0;
        trigger <= '1';
    end if;
        timer1 := timer1 + 1;    
    if echo = '1' then
        timer2 := timer2 + 1;
    elsif echo = '0' and data_controll ='1' then
        echo_timer := timer2;
        distance_signal <= integer((timer2*17)/100000); -- for the calculation x = t*(0.00017) 
        distance1 <= distance_signal;      -- this calculation comes from the speed of sound(342m/s) x2 divide it 100000 to get milisecond
        timer2 := 0;
        data_controll := '0';
    end if;  
    if distance_signal > 25 then        -- this if statement goes to the buzzer module
        buzzer_trig <= '1';
    else
         buzzer_trig <= '0';
    end if;
    if distance_signal > 10 and distance_signal < 35 then            -- this if statement goes to the servo module
        to_servo <= '1';
    else
        to_servo <= '0';
    end if;
end if;
end process;
end Behavioral;