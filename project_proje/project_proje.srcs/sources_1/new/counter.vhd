-- Written by Atahan Iyiekici--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
    Port ( clk : in STD_LOGIC;
           anode_cases : out STD_LOGIC_VECTOR (1 downto 0);
           select_for_mux: out STD_LOGIC_VECTOR (1 downto 0));
end counter;

architecture Behavioral of counter is
signal count: integer := 0;
signal sc: std_logic_vector(1 downto 0) := (others => '0');

begin
process(CLK)
begin
    if rising_edge(CLK) then
        if count < 100000 then
            count <= count + 1;
        else
            count <= 0;
            sc <= sc + 1;
        end if;
     end if;
end process;
anode_cases <= sc;
select_for_mux <= sc;
end Behavioral;