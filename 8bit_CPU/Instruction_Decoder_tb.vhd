
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder_tb is
end Instruction_Decoder_tb;

architecture Behavioral of Instruction_Decoder_tb is

    component Instruction_Decoder
        Port (
            INSTRUCTION : in  STD_LOGIC_VECTOR(11 downto 0);
            OPCODE      : out STD_LOGIC_VECTOR(3 downto 0);
            IMMEDIATE   : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal INSTRUCTION : STD_LOGIC_VECTOR(11 downto 0) := x"000";
    signal OPCODE      : STD_LOGIC_VECTOR(3 downto 0);
    signal IMMEDIATE   : STD_LOGIC_VECTOR(7 downto 0);

begin

    UUT: Instruction_Decoder
        port map (
            INSTRUCTION => INSTRUCTION,
            OPCODE      => OPCODE,
            IMMEDIATE   => IMMEDIATE
        );

    STIMULUS: process
    begin

        INSTRUCTION <= x"13C";
        wait for 10 ns;
        assert OPCODE = "0001" and IMMEDIATE = x"3C"
            report "LDI decode failed"
            severity error;

        INSTRUCTION <= x"20F";
        wait for 10 ns;
        assert OPCODE = "0010" and IMMEDIATE = x"0F"
            report "ADD decode failed"
            severity error;

        INSTRUCTION <= x"30B";
        wait for 10 ns;
        assert OPCODE = "0011" and IMMEDIATE = x"0B"
            report "SUB decode failed"
            severity error;

        INSTRUCTION <= x"4F0";
        wait for 10 ns;
        assert OPCODE = "0100" and IMMEDIATE = x"F0"
            report "AND decode failed"
            severity error;

        INSTRUCTION <= x"50A";
        wait for 10 ns;
        assert OPCODE = "0101" and IMMEDIATE = x"0A"
            report "OR decode failed"
            severity error;

        report "Instruction Decoder tests completed"
            severity note;

        wait;
    end process;

end Behavioral;