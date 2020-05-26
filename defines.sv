`ifndef DEFINES_SV
`define DEFINES_SV

`define SIGN_EXTEND32(n, r) {{(32-n){r[n-1]}}, r} 

typedef enum integer {
    LUI, AUIPC, JAL, JALR, BEQ, BNE, BLT, BGE, BLTU,
    BGEU, LB, LH, LW, LBU, LHU, SB, SH, SW, ADDI,
    SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI,
    ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR,
    AND, FENCE, ECALL, EBREAK, NOP
  } rv32i_t;

typedef enum integer {
    ALU_ADD, ALU_SUB, ALU_NOT, 
    ALU_LS, ALU_RS, ALU_AND, ALU_OR, ALU_LT
  } alu_code_t;

`endif