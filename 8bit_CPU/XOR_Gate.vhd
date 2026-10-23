library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end XOR_Gate;

architecture Behavioral of XOR_Gate is
begin
    Y <= A XOR B;
end Behavioral;