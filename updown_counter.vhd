library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown_counter is
    Port ( i_clk, i_rst, i_updown : in  STD_LOGIC;
	   i_start_num : in STD_LOGIC_VECTOR (3 downto 0);
           o_cnt_value : out  STD_LOGIC_VECTOR (3 downto 0));
end updown_counter;

architecture Behavioral of updown_counter is

signal temp_cnt : std_logic_vector (3 downto 0) := "0000";

begin
process(i_clk, i_rst)
begin

if (i_rst = '1') then
	temp_cnt <= i_start_num;
elsif (rising_edge(i_clk)) then
	if (i_updown = '1') then
		temp_cnt <= temp_cnt + 1;
	else
		temp_cnt <= temp_cnt - 1;
	end if;
end if;
end process;

o_cnt_value <= temp_cnt;
end Behavioral;