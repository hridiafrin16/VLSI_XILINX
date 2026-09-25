library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port (
        A     : in STD_LOGIC;
        B     : in STD_LOGIC;
        Cin   : in STD_LOGIC;
        Sum   : out STD_LOGIC;
        Cout  : out STD_LOGIC
    );
end Full_Adder;

architecture Structural of Full_Adder is

    component Half_Adder
        Port (
            A     : in STD_LOGIC;
            B     : in STD_LOGIC;
            Sum   : out STD_LOGIC;
            Carry : out STD_LOGIC
        );
    end component;

    signal S1     : STD_LOGIC;
    signal C1     : STD_LOGIC;
    signal C2     : STD_LOGIC;

begin

    HA1: Half_Adder
        port map (
            A     => A,
            B     => B,
            Sum   => S1,
            Carry => C1
        );

    HA2: Half_Adder
        port map (
            A     => S1,
            B     => Cin,
            Sum   => Sum,
            Carry => C2
        );

    Cout <= C1 OR C2;

end Structural;