
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_Top_tb is
end CPU_Top_tb;

architecture Behavioral of CPU_Top_tb is

    component CPU_Top
        Port (
            CLK             : in  STD_LOGIC;
            RESET           : in  STD_LOGIC;
            PC_OUT          : out STD_LOGIC_VECTOR(3 downto 0);
            INSTRUCTION_OUT : out STD_LOGIC_VECTOR(11 downto 0);
            ACC_OUT         : out STD_LOGIC_VECTOR(7 downto 0);
            ZERO_OUT        : out STD_LOGIC
        );
    end component;

    signal CLK             : STD_LOGIC := '0';
    signal RESET           : STD_LOGIC := '1';
    signal PC_OUT          : STD_LOGIC_VECTOR(3 downto 0);
    signal INSTRUCTION_OUT : STD_LOGIC_VECTOR(11 downto 0);
    signal ACC_OUT         : STD_LOGIC_VECTOR(7 downto 0);
    signal ZERO_OUT        : STD_LOGIC;

begin

    UUT: CPU_Top
        port map (
            CLK             => CLK,
            RESET           => RESET,
            PC_OUT          => PC_OUT,
            INSTRUCTION_OUT => INSTRUCTION_OUT,
            ACC_OUT         => ACC_OUT,
            ZERO_OUT        => ZERO_OUT
        );

    -- 10 ns clock period
    CLK_PROCESS: process
    begin
        while true loop
            CLK <= '0';
            wait for 5 ns;
            CLK <= '1';
            wait for 5 ns;
        end loop;
    end process;

    STIMULUS: process
    begin

        -- Reset PC
        RESET <= '1';
        wait for 10 ns;

        -- Start CPU
        RESET <= '0';

        -- Address 0: LDI 3C
        wait for 10 ns;
        assert ACC_OUT = x"3C"
            report "LDI test failed"
            severity error;

        -- Address 1: ADD 0F
        wait for 10 ns;
        assert ACC_OUT = x"4B"
            report "ADD test failed"
            severity error;

        -- Address 2: SUB 0B
        wait for 10 ns;
        assert ACC_OUT = x"40"
            report "SUB test failed"
            severity error;

        -- Address 3: AND F0
        wait for 10 ns;
        assert ACC_OUT = x"40"
            report "AND test failed"
            severity error;

        -- Address 4: OR 0A
        wait for 10 ns;
        assert ACC_OUT = x"4A"
            report "OR test failed"
            severity error;

        -- Address 5: SUB 4A
        wait for 10 ns;
        assert ACC_OUT = x"00" and ZERO_OUT = '1'
            report "Zero result test failed"
            severity error;

        -- Address 6: SUB 01
        wait for 10 ns;
        assert ACC_OUT = x"FF" and ZERO_OUT = '0'
            report "8-bit wraparound test failed"
            severity error;

        report "CPU test sequence completed"
            severity note;

        wait;
    end process;

end Behavioral;