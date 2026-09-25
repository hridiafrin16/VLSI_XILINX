library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_bit8 is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end Full_Adder_bit8;

architecture Structural of Full_Adder_bit8 is

    component Full_Adder_bit4
        Port (
            A    : in  STD_LOGIC_VECTOR(3 downto 0);
            B    : in  STD_LOGIC_VECTOR(3 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    signal C4 : STD_LOGIC;

begin

    -- Lower 4 bits
    FA4_LOW: Full_Adder_bit4
        port map (
            A    => A(3 downto 0),
            B    => B(3 downto 0),
            Cin  => Cin,
            Sum  => Sum(3 downto 0),
            Cout => C4
        );

    -- Upper 4 bits
    FA4_HIGH: Full_Adder_bit4
        port map (
            A    => A(7 downto 4),
            B    => B(7 downto 4),
            Cin  => C4,
            Sum  => Sum(7 downto 4),
            Cout => Cout
        );

end Structural;