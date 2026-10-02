library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_GATE is
    Port (
        A : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end NOT_GATE;

architecture Dataflow of NOT_GATE is

begin

    Y <= NOT A;

end Dataflow;