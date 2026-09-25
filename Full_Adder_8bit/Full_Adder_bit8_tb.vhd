library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_bit8_tb is
end Full_Adder_bit8_tb;

architecture behavior of Full_Adder_bit8_tb is

    component Full_Adder_bit8
        Port (
            A    : in  STD_LOGIC_VECTOR(7 downto 0);
            B    : in  STD_LOGIC_VECTOR(7 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR(7 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    signal A    : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal B    : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal Cin  : STD_LOGIC := '0';
    signal Sum  : STD_LOGIC_VECTOR(7 downto 0);
    signal Cout : STD_LOGIC;

begin

    uut: Full_Adder_bit8
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );

    stim_proc: process
    begin

        A <= "00000000";
        B <= "00000000";
        Cin <= '0';
        wait for 100 ns;

        A <= "00000001";
        B <= "00000010";
        Cin <= '0';
        wait for 100 ns;

        A <= "00001111";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;

        A <= "00001111";
        B <= "00000001";
        Cin <= '1';
        wait for 100 ns;

        A <= "11111111";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;

        A <= "10101010";
        B <= "01010101";
        Cin <= '0';
        wait for 100 ns;

        A <= "11111111";
        B <= "11111111";
        Cin <= '0';
        wait for 100 ns;

        A <= "11111111";
        B <= "11111111";
        Cin <= '1';
        wait for 100 ns;

        wait;

    end process;

end behavior;