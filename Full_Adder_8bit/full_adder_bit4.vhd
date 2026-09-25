library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_bit4 is
    Port (
        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC
    );
end Full_Adder_bit4;

architecture Structural of Full_Adder_bit4 is

    component Full_Adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    signal C1, C2, C3 : STD_LOGIC;

begin

    FA0: Full_Adder
        port map (
            A    => A(0),
            B    => B(0),
            Cin  => Cin,
            Sum  => Sum(0),
            Cout => C1
        );

    FA1: Full_Adder
        port map (
            A    => A(1),
            B    => B(1),
            Cin  => C1,
            Sum  => Sum(1),
            Cout => C2
        );

    FA2: Full_Adder
        port map (
            A    => A(2),
            B    => B(2),
            Cin  => C2,
            Sum  => Sum(2),
            Cout => C3
        );

    FA3: Full_Adder
        port map (
            A    => A(3),
            B    => B(3),
            Cin  => C3,
            Sum  => Sum(3),
            Cout => Cout
        );

end Structural;