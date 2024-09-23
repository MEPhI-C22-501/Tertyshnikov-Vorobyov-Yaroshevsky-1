library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity updown_counter_tester is

port (
	i_clk, i_rst, i_updown : out STD_LOGIC;
	i_start_num : out STD_LOGIC_VECTOR (3 downto 0)
);

end updown_counter_tester;


architecture updown_counter_tester_arch of updown_counter_tester is

constant num_of_clocks : integer := 50;
constant clk_period : time := 10 ns;
signal clk_sig : STD_LOGIC := '0';
signal i : integer := 0;


begin

process
begin

clk_sig <= not clk_sig;
wait for clk_period;
i_clk <= clk_sig;
i <= i + 1;

if (i = num_of_clocks) then
	wait;
elsif (i = 1) then
	i_rst <= '1';
	i_start_num <= "1010";
	wait for clk_period;
	i_rst <= '0';
elsif (i = 30) then
 	i_rst <= '1';
	i_start_num <= "0101";
	wait for clk_period;
	i_rst <= '0';
elsif (i < num_of_clocks / 3) then
	i_updown <= '1';
elsif (i < num_of_clocks / 3 * 2) then
	i_updown <= '0';
end if;

end process;

end updown_counter_tester_arch;