
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit_tb is
end Control_Unit_tb;

architecture Behavioral of Control_Unit_tb is

    component Control_Unit
        Port (
            OPCODE         : in  STD_LOGIC_VECTOR(3 downto 0);
            ACC_LOAD       : out STD_LOGIC;
            LOAD_IMMEDIATE : out STD_LOGIC;
            ALU_OPCODE     : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal OPCODE         : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal ACC_LOAD       : STD_LOGIC;
    signal LOAD_IMMEDIATE : STD_LOGIC;
    signal ALU_OPCODE     : STD_LOGIC_VECTOR(3 downto 0);

begin

    UUT: Control_Unit
        port map (
            OPCODE         => OPCODE,
            ACC_LOAD       => ACC_LOAD,
            LOAD_IMMEDIATE => LOAD_IMMEDIATE,
            ALU_OPCODE     => ALU_OPCODE
        );

    STIMULUS: process
    begin

        OPCODE <= "0001";
        wait for 10 ns;
        assert ACC_LOAD = '1' and LOAD_IMMEDIATE = '1'
            report "LDI control failed"
            severity error;

        OPCODE <= "0010";
        wait for 10 ns;
        assert ACC_LOAD = '1' and LOAD_IMMEDIATE = '0'
            report "ADD control failed"
            severity error;

        OPCODE <= "0011";
        wait for 10 ns;
        assert ACC_LOAD = '1' and LOAD_IMMEDIATE = '0'
            report "SUB control failed"
            severity error;

        OPCODE <= "0100";
        wait for 10 ns;
        assert ACC_LOAD = '1' and LOAD_IMMEDIATE = '0'
            report "AND control failed"
            severity error;

        OPCODE <= "0101";
        wait for 10 ns;
        assert ACC_LOAD = '1' and LOAD_IMMEDIATE = '0'
            report "OR control failed"
            severity error;

        OPCODE <= "0000";
        wait for 10 ns;
        assert ACC_LOAD = '0' and LOAD_IMMEDIATE = '0'
            report "Invalid opcode control failed"
            severity error;

        report "Control Unit tests completed"
            severity note;

        wait;
    end process;

end Behavioral;