library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_bit4_tb is
end Full_Adder_bit4_tb;

architecture behavior of Full_Adder_bit4_tb is

    component Full_Adder_bit4
        Port (
            A    : in  STD_LOGIC_VECTOR(3 downto 0);
            B    : in  STD_LOGIC_VECTOR(3 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    signal A    : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal B    : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Cin  : STD_LOGIC := '0';
    signal Sum  : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;

begin

    uut: Full_Adder_bit4
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );

    stim_proc: process
    begin

        A <= "0000";
        B <= "0000";
        Cin <= '0';
        wait for 100 ns;

        A <= "0001";
        B <= "0010";
        Cin <= '0';
        wait for 100 ns;

        A <= "0011";
        B <= "0010";
        Cin <= '0';
        wait for 100 ns;

        A <= "0101";
        B <= "0011";
        Cin <= '0';
        wait for 100 ns;

        A <= "0111";
        B <= "0001";
        Cin <= '1';
        wait for 100 ns;

        A <= "1010";
        B <= "0101";
        Cin <= '0';
        wait for 100 ns;

        A <= "1111";
        B <= "0001";
        Cin <= '0';
        wait for 100 ns;

        A <= "1111";
        B <= "1111";
        Cin <= '1';
        wait for 100 ns;

        wait;

    end process;

end behavior;