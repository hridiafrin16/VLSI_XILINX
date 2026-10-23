
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_Top is
    Port (
        CLK             : in  STD_LOGIC;
        RESET           : in  STD_LOGIC;
        PC_OUT          : out STD_LOGIC_VECTOR(3 downto 0);
        INSTRUCTION_OUT : out STD_LOGIC_VECTOR(11 downto 0);
        ACC_OUT         : out STD_LOGIC_VECTOR(7 downto 0);
        ZERO_OUT        : out STD_LOGIC
    );
end CPU_Top;

architecture Structural of CPU_Top is

    component PC
        Port (
            CLK    : in  STD_LOGIC;
            RESET  : in  STD_LOGIC;
            PC_IN  : in  STD_LOGIC_VECTOR(3 downto 0);
            PC_OUT : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component PC_Incrementer
        Port (
            PC_IN  : in  STD_LOGIC_VECTOR(3 downto 0);
            PC_OUT : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component ROM
        Port (
            ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
            INSTRUCTION : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    component Instruction_Decoder
        Port (
            INSTRUCTION : in  STD_LOGIC_VECTOR(11 downto 0);
            OPCODE      : out STD_LOGIC_VECTOR(3 downto 0);
            IMMEDIATE   : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component Control_Unit
        Port (
            OPCODE         : in  STD_LOGIC_VECTOR(3 downto 0);
            ACC_LOAD       : out STD_LOGIC;
            LOAD_IMMEDIATE : out STD_LOGIC;
            ALU_OPCODE     : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component ALU
        Port (
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
            B      : in  STD_LOGIC_VECTOR(7 downto 0);
            OPCODE : in  STD_LOGIC_VECTOR(3 downto 0);
            RESULT : out STD_LOGIC_VECTOR(7 downto 0);
            ZERO   : out STD_LOGIC
        );
    end component;

    component ACC_Register
        Port (
            CLK  : in  STD_LOGIC;
            LOAD : in  STD_LOGIC;
            DATA : in  STD_LOGIC_VECTOR(7 downto 0);
            Q    : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component MUX_2to1
        Port (
            A   : in  STD_LOGIC;
            B   : in  STD_LOGIC;
            SEL : in  STD_LOGIC;
            Y   : out STD_LOGIC
        );
    end component;

    component Zero_Flag
        Port (
            DATA : in  STD_LOGIC_VECTOR(7 downto 0);
            ZERO : out STD_LOGIC
        );
    end component;

    signal PC_CURRENT : STD_LOGIC_VECTOR(3 downto 0);
    signal PC_NEXT    : STD_LOGIC_VECTOR(3 downto 0);

    signal INSTRUCTION : STD_LOGIC_VECTOR(11 downto 0);
    signal OPCODE      : STD_LOGIC_VECTOR(3 downto 0);
    signal IMMEDIATE   : STD_LOGIC_VECTOR(7 downto 0);
    signal ALU_OPCODE  : STD_LOGIC_VECTOR(3 downto 0);

    signal ACC_LOAD       : STD_LOGIC;
    signal LOAD_IMMEDIATE : STD_LOGIC;

    signal ACC_DATA    : STD_LOGIC_VECTOR(7 downto 0);
    signal ALU_RESULT  : STD_LOGIC_VECTOR(7 downto 0);
    signal ACC_NEXT    : STD_LOGIC_VECTOR(7 downto 0);
    signal ALU_ZERO    : STD_LOGIC;

begin

    -- Program Counter
    U_PC: PC
        port map (
            CLK    => CLK,
            RESET  => RESET,
            PC_IN  => PC_NEXT,
            PC_OUT => PC_CURRENT
        );

    -- Next instruction address
    U_PC_INC: PC_Incrementer
        port map (
            PC_IN  => PC_CURRENT,
            PC_OUT => PC_NEXT
        );

    -- Instruction ROM
    U_ROM: ROM
        port map (
            ADDRESS     => PC_CURRENT,
            INSTRUCTION => INSTRUCTION
        );

    -- Decode instruction
    U_DECODER: Instruction_Decoder
        port map (
            INSTRUCTION => INSTRUCTION,
            OPCODE      => OPCODE,
            IMMEDIATE   => IMMEDIATE
        );

    -- Control Unit
    U_CONTROL: Control_Unit
        port map (
            OPCODE         => OPCODE,
            ACC_LOAD       => ACC_LOAD,
            LOAD_IMMEDIATE => LOAD_IMMEDIATE,
            ALU_OPCODE     => ALU_OPCODE
        );

    -- Arithmetic Logic Unit
    U_ALU: ALU
        port map (
            A      => ACC_DATA,
            B      => IMMEDIATE,
            OPCODE => ALU_OPCODE,
            RESULT => ALU_RESULT,
            ZERO   => ALU_ZERO
        );

    -- Select immediate for LDI, otherwise ALU result
    GEN_ACC_MUX: for i in 0 to 7 generate
        MUX_ACC: MUX_2to1
            port map (
                A   => ALU_RESULT(i),
                B   => IMMEDIATE(i),
                SEL => LOAD_IMMEDIATE,
                Y   => ACC_NEXT(i)
            );
    end generate GEN_ACC_MUX;

    -- Accumulator Register
    U_ACC: ACC_Register
        port map (
            CLK  => CLK,
            LOAD => ACC_LOAD,
            DATA => ACC_NEXT,
            Q    => ACC_DATA
        );

    -- Zero flag from current accumulator value
    U_ZERO: Zero_Flag
        port map (
            DATA => ACC_DATA,
            ZERO => ZERO_OUT
        );

    PC_OUT          <= PC_CURRENT;
    INSTRUCTION_OUT <= INSTRUCTION;
    ACC_OUT         <= ACC_DATA;

end Structural;