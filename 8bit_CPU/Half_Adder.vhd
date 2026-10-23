
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port (
        A, B       : in  STD_LOGIC;
        SUM, CARRY : out STD_LOGIC
    );
end Half_Adder;

architecture Structural of Half_Adder is
    component XOR_Gate
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    component AND_Gate
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;
begin
    X1: XOR_Gate port map(A => A, B => B, Y => SUM);
    A1: AND_Gate port map(A => A, B => B, Y => CARRY);
end Structural;