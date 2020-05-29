interface instruction_parser (
  input logic[31:0] instruction
);
  
  wire[6:0] opcode;
  wire[4:0] rd,rs1,rs2;
  wire[2:0] funct3;
  wire[6:0] funct7;
  wire[11:0] i_imm;  
  wire[11:0] s_imm;
  wire[11:0] b_imm;
  wire[19:0] u_imm;
  wire[19:0] j_imm;
  wire aluc;
  wire ebit;
  
  assign opcode = instruction[6:0];
  assign rd = instruction[11:7];
  assign funct3 = instruction[14:12];
  assign rs1 = instruction[19:15];
  assign rs2 = instruction[24:20];
  assign funct7 = instruction[31:25];
  assign i_imm = instruction[31:20];
  assign u_imm = instruction[31:12];
  assign aluc = instruction[30];
  assign ebit = instruction[20];
  
  assign s_imm = {instruction[31:25], instruction[11:7]};
  assign j_imm = {instruction[31], instruction[19:12], instruction[20], instruction[30:21]};
  assign b_imm = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]};

  rv32i_t name;
  
endinterface
