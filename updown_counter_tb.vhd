library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown_counter_tb is
end entity;

architecture updown_counter_tb_arch of updown_counter_tb is

signal i_updown : STD_LOGIC;
signal i_rst : STD_LOGIC;
signal i_start_num : STD_LOGIC_VECTOR (3 downto 0);
signal o_cnt_value : STD_LOGIC_VECTOR (3 downto 0);
signal clk_sig : STD_LOGIC;

	component updown_counter is
	port (i_clk, i_rst, i_updown : in STD_LOGIC;
		i_start_num : in STD_LOGIC_VECTOR (3 downto 0);
	o_cnt_value : out STD_LOGIC_VECTOR (3 downto 0));
	end component;

	component updown_counter_tester is
	port (i_clk, i_rst, i_updown : out STD_LOGIC;
		i_start_num : out STD_LOGIC_VECTOR (3 downto 0));
	end component;


begin

t1: updown_counter_tester port map(
	i_clk => clk_sig,
	i_rst => i_rst,
	i_updown => i_updown,
	i_start_num => i_start_num
);

t2: updown_counter port map(
	i_clk => clk_sig,
	i_rst => i_rst,
	i_updown => i_updown,
	i_start_num => i_start_num,
	o_cnt_value => o_cnt_value
);

end updown_counter_tb_arch;