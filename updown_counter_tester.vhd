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
-- signal i : integer := 0;


procedure wait_clk(constant j: in integer) is 
variable ii: integer := 0;
begin

while ii < j loop
	if (rising_edge(clk_sig)) then
		ii := ii + 1;
	end if;
	wait for 10 ps;
end loop;

end;




begin

clk_sig <= not clk_sig after clk_period / 2;
i_clk <= clk_sig;

process
begin

i_updown <= '1';
wait_clk(1);

i_rst <= '1';
i_start_num <= "1010";
wait_clk(1);

i_rst <= '0';
wait_clk(20);

i_updown <= '0';
wait_clk(1);

i_rst <= '1';
i_start_num <= "0101";
wait_clk(1);

i_rst <= '0';
wait_clk(20);

wait;

end process;

end updown_counter_tester_arch;