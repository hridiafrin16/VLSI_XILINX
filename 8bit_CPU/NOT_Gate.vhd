library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_Gate is
    Port (
        A : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end NOT_Gate;

architecture Behavioral of NOT_Gate is
begin
    Y <= NOT A;
end Behavioral;