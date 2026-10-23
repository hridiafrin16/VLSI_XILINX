
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port (
        A        : in  STD_LOGIC_VECTOR(7 downto 0);
        B        : in  STD_LOGIC_VECTOR(7 downto 0);
        OPCODE   : in  STD_LOGIC_VECTOR(3 downto 0);
        RESULT   : out STD_LOGIC_VECTOR(7 downto 0);
        ZERO     : out STD_LOGIC
    );
end ALU;

architecture Structural of ALU is

    component Adder_8bit
        Port (
            A    : in  STD_LOGIC_VECTOR(7 downto 0);
            B    : in  STD_LOGIC_VECTOR(7 downto 0);
            SUM  : out STD_LOGIC_VECTOR(7 downto 0);
            COUT : out STD_LOGIC
        );
    end component;

    component Subtractor_8bit
        Port (
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
            B      : in  STD_LOGIC_VECTOR(7 downto 0);
            DIFF   : out STD_LOGIC_VECTOR(7 downto 0);
            BORROW : out STD_LOGIC
        );
    end component;

    component AND_Gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component OR_Gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal ADD_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal SUB_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal AND_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal OR_RESULT  : STD_LOGIC_VECTOR(7 downto 0);

    signal CARRY_OUT  : STD_LOGIC;
    signal BORROW_OUT : STD_LOGIC;
	 signal RESULT_INTERNAL : STD_LOGIC_VECTOR(7 downto 0);

begin

    ADD_UNIT: Adder_8bit
        port map (
            A    => A,
            B    => B,
            SUM  => ADD_RESULT,
            COUT => CARRY_OUT
        );

    SUB_UNIT: Subtractor_8bit
        port map (
            A      => A,
            B      => B,
            DIFF   => SUB_RESULT,
            BORROW => BORROW_OUT
        );

    GEN_LOGIC: for i in 0 to 7 generate

        AND_UNIT: AND_Gate
            port map (
                A => A(i),
                B => B(i),
                Y => AND_RESULT(i)
            );

        OR_UNIT: OR_Gate
            port map (
                A => A(i),
                B => B(i),
                Y => OR_RESULT(i)
            );

    end generate GEN_LOGIC;

    process(A, B, OPCODE,
        ADD_RESULT, SUB_RESULT, AND_RESULT, OR_RESULT)
begin
    case OPCODE is

        when "0010" =>
            RESULT_INTERNAL <= ADD_RESULT;

        when "0011" =>
            RESULT_INTERNAL <= SUB_RESULT;

        when "0100" =>
            RESULT_INTERNAL <= AND_RESULT;

        when "0101" =>
            RESULT_INTERNAL <= OR_RESULT;

        when others =>
            RESULT_INTERNAL <= x"00";

    end case;
end process;


RESULT <= RESULT_INTERNAL;

ZERO <= '1' when RESULT_INTERNAL = x"00" else '0';

end Structural;