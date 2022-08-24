-- Written by Atahan Iyiekici--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servomodule is
    Port ( clk : in std_logic;
           resett : in std_logic_vector(1 downto 0);
           servo : out std_logic;
           servo_reset : in std_logic      
           );
end servomodule;

architecture Behavioral of servomodule is
signal period_counter : integer range 0 to 2000000 := 0;  --period_counter stands for the 20 ms period which servo needs to perceive the pulse
signal pwm: integer range 75000 to 175000 := 75000;    -- pwm between 1ms and 2 ms makes servo turn for 90 degrees
signal pwm_delta : integer range 500 to 10000:= 500;     -- pwm_delta value stands for the speed of servo
begin
process(clk,servo_reset)
variable turn : boolean := true;            -- with this statement the servo can turn
begin
    if servo_reset = '1' then
        servo <= '0';
    else
        if rising_edge(clk) then
            if period_counter < pwm  then
                servo <= '1'; 
            else
                servo <= '0';
            end if;
        if period_counter = 2000000 then  
            if pwm = 75000 then
                turn := true;
            elsif pwm = 175000 then
                turn := false;
            end if;
                if turn then
                    pwm <= pwm + pwm_delta;
                else
                    pwm <= pwm - pwm_delta;
                end if;
            end if;
                period_counter <= period_counter + 1;
            if resett = "11" then
                servo <= '0';
            elsif resett = "01" then
                turn := true;
            elsif resett = "10" then
                turn := false;
            end if;
        end if;
    end if;                
end process;
end Behavioral;