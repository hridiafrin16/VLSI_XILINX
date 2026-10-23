
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
    Port (
        INSTRUCTION : in  STD_LOGIC_VECTOR(11 downto 0);
        OPCODE      : out STD_LOGIC_VECTOR(3 downto 0);
        IMMEDIATE   : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Instruction_Decoder;

architecture Structural of Instruction_Decoder is
begin

    OPCODE    <= INSTRUCTION(11 downto 8);
    IMMEDIATE <= INSTRUCTION(7 downto 0);

end Structural;