-- Written by Atahan Iyiekici--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity top_module is
    Port ( clk : in std_logic;
           echo : in std_logic;
           echo2 : in std_logic;
           trigger : out std_logic;
           trigger2 : out std_logic;
           anode : out std_logic_vector(3 downto 0);
           bcd_out : out std_logic_vector(6 downto 0);
           servo: out std_logic;
           servo_reset : in std_logic;
           sensor1: inout std_logic;
           sensor2: inout std_logic;
           buzzer_out: out std_logic;
           buzzer_trig: out std_logic;
           buzzer_reset: in std_logic);
end top_module;
architecture Behavioral of top_module is

component rangesensor
    Port ( clk : in STD_LOGIC;
       echo : in STD_LOGIC;
       buzzer_trig : out STD_LOGIC;
       to_servo : out std_logic;
       trigger : out STD_LOGIC;
       distance1: inout integer);
end component;

component counter
    Port ( clk : in STD_LOGIC;
       anode_cases : out STD_LOGIC_VECTOR (1 downto 0);
       select_for_mux : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component anode_decoder
    Port ( anode_cases : in STD_LOGIC_VECTOR (1 downto 0);
       anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component BCD
    Port ( bcd_in : in integer; 
       bcd_out : out std_logic_vector(6 downto 0));
end component;

component Muxx
    Port (select_for_mux: in std_logic_vector(1 downto 0);
          mux_out : out integer;
          distance1 : inout integer;
          distance2 : inout integer );
end component;

component buzzer
    Port ( buzzer_in : in std_logic;
           buzzer_reset : in std_logic;
           resett : in std_logic_vector(1 downto 0);
           buzzer_out : out std_logic
             );
end component;

component rangesensor2
    Port ( clk : in STD_LOGIC;
           echo2 : in std_logic;
           to_servo2 : out std_logic;
           trigger2 : out std_logic;
           distance2: inout integer);
end component;

component servomodule
  Port (clk : in std_logic;
        servo : out std_logic;
        servo_reset : in std_logic;
        resett : in std_logic_vector(1 downto 0)
         );
end component;

signal anode_cases: std_logic_vector(1 downto 0);
signal to_mux: std_logic_vector(1 downto 0);
signal dist_signal_1: integer;
signal dist_signal_2 : integer;
signal to_bcd: integer;
signal buzzer_ins : std_logic;
begin
Servo_module: servomodule
    port map( clk => clk,
              servo => servo,
              servo_reset => servo_reset,
              resett(0) => sensor1,
              resett(1) => sensor2
                );
RS1: rangesensor 
    port map (clk => clk,
           echo => echo,
           buzzer_trig => buzzer_ins,
           to_servo => sensor1,
           trigger => trigger,
           distance1 => dist_signal_1);
RS2: rangesensor2 port map( 
             clk => clk,
             echo2 => echo2,
             to_servo2 => sensor2,
             trigger2 => trigger2,
             distance2 => dist_signal_2
               );
Counter1: counter 
        port map( clk => clk, 
        anode_cases => anode_cases,
        select_for_mux => to_mux);
AnodeDecoder: anode_decoder 
    port map( anode_cases => anode_cases,
                    anode => anode);
BtoD: BCD 
    port map( bcd_in => to_bcd,
              bcd_out=> bcd_out);
Multiplexer: Muxx port map( select_for_mux => to_mux,
                            mux_out => to_bcd,
                            distance1 => dist_signal_1,
                            distance2 => dist_signal_2);
Buzzerr: buzzer port map( buzzer_in => buzzer_ins,
                          buzzer_out=> buzzer_out,
                          resett(0) => sensor1,
                          resett(1) => sensor2,
                          buzzer_reset => buzzer_reset  
                            );
buzzer_trig <= buzzer_ins;
end Behavioral;