
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is

    component ALU
        Port (
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
            B      : in  STD_LOGIC_VECTOR(7 downto 0);
            OPCODE : in  STD_LOGIC_VECTOR(3 downto 0);
            RESULT : out STD_LOGIC_VECTOR(7 downto 0);
            ZERO   : out STD_LOGIC
        );
    end component;

    signal A      : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal B      : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal OPCODE : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal ZERO   : STD_LOGIC;

begin

    UUT: ALU
        port map (
            A      => A,
            B      => B,
            OPCODE => OPCODE,
            RESULT => RESULT,
            ZERO   => ZERO
        );

    STIMULUS: process
    begin

        -- ADD: 3C + 0F = 4B
        A <= x"3C";
        B <= x"0F";
        OPCODE <= "0010";
        wait for 10 ns;

        assert RESULT = x"4B" and ZERO = '0'
            report "ADD test failed"
            severity error;

        -- SUB: 40 - 0B = 35
        A <= x"40";
        B <= x"0B";
        OPCODE <= "0011";
        wait for 10 ns;

        assert RESULT = x"35" and ZERO = '0'
            report "SUB test failed"
            severity error;

        -- AND: 40 AND F0 = 40
        A <= x"40";
        B <= x"F0";
        OPCODE <= "0100";
        wait for 10 ns;

        assert RESULT = x"40" and ZERO = '0'
            report "AND test failed"
            severity error;

        -- OR: 40 OR 0A = 4A
        A <= x"40";
        B <= x"0A";
        OPCODE <= "0101";
        wait for 10 ns;

        assert RESULT = x"4A" and ZERO = '0'
            report "OR test failed"
            severity error;

        -- Zero result test: 40 - 40 = 00
        A <= x"40";
        B <= x"40";
        OPCODE <= "0011";
        wait for 10 ns;

        assert RESULT = x"00" and ZERO = '1'
            report "Zero flag test failed"
            severity error;

        report "ALU tests completed"
            severity note;

        wait;
    end process;

end Behavioral;