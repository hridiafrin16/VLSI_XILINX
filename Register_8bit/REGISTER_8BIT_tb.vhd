library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REGISTER_8BIT_tb is
end REGISTER_8BIT_tb;

architecture Behavioral of REGISTER_8BIT_tb is

    component REGISTER_8BIT
        Port (
            D   : in  STD_LOGIC_VECTOR(7 downto 0);
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC_VECTOR(7 downto 0);
            Qn  : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal D   : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal CLK : STD_LOGIC := '0';
    signal Q   : STD_LOGIC_VECTOR(7 downto 0);
    signal Qn  : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: REGISTER_8BIT
        port map (
            D   => D,
            CLK => CLK,
            Q   => Q,
            Qn  => Qn
        );

    stimulus: process
    begin

        D <= "00000000";
        CLK <= '0';
        wait for 10 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        D <= "10101010";
        wait for 10 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        D <= "11001100";
        wait for 10 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        D <= "11110000";
        wait for 10 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        D <= "01010101";
        wait for 10 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;