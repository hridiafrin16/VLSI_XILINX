
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_tb is
end ROM_tb;

architecture Behavioral of ROM_tb is

    component ROM
        Port (
            ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
            INSTRUCTION : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    signal ADDRESS     : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal INSTRUCTION : STD_LOGIC_VECTOR(11 downto 0);

begin

    UUT: ROM
        port map (
            ADDRESS     => ADDRESS,
            INSTRUCTION => INSTRUCTION
        );

    STIMULUS: process
    begin

        ADDRESS <= "0000";
        wait for 10 ns;
        assert INSTRUCTION = x"13C"
            report "ROM address 0 failed"
            severity error;

        ADDRESS <= "0001";
        wait for 10 ns;
        assert INSTRUCTION = x"20F"
            report "ROM address 1 failed"
            severity error;

        ADDRESS <= "0010";
        wait for 10 ns;
        assert INSTRUCTION = x"30B"
            report "ROM address 2 failed"
            severity error;

        ADDRESS <= "0011";
        wait for 10 ns;
        assert INSTRUCTION = x"4F0"
            report "ROM address 3 failed"
            severity error;

        ADDRESS <= "0100";
        wait for 10 ns;
        assert INSTRUCTION = x"50A"
            report "ROM address 4 failed"
            severity error;

        ADDRESS <= "0101";
        wait for 10 ns;
        assert INSTRUCTION = x"34A"
            report "ROM address 5 failed"
            severity error;

        ADDRESS <= "0110";
        wait for 10 ns;
        assert INSTRUCTION = x"301"
            report "ROM address 6 failed"
            severity error;

        report "ROM tests completed successfully"
            severity note;

        wait;
    end process;

end Behavioral;