interface instruction_parser (
  input logic[31:0] instruction
);
  
  wire[6:0] opcode;
  wire[4:0] rd,rs1,rs2;
  wire[2:0] funct3;
  wire[6:0] funct7;
  wire[11:0] i_imm11c0;
  wire[6:0] s_imm11c5;
  wire[5:0] s_imm4c0;
  wire[6:0] b_imm12_10c5;
  wire[5:0] b_imm4c1_11;
  wire[19:0] u_imm31c12;
  wire[19:0] j_imm20_10c1_11_19c12;
  wire aluc;
  wire ebit;
  
  assign opcode = instruction[6:0];
  assign rd = instruction[11:7];
  assign funct3 = instruction[14:12];
  assign rs1 = instruction[19:15];
  assign rs2 = instruction[24:20];
  assign funct7 = instruction[31:25];
  assign i_imm11c0 = instruction[31:20];
  assign s_imm11c5 = instruction[31:25];
  assign s_imm4c0 = instruction[11:7];
  assign b_imm12_10c5 = instruction[31:25];
  assign b_imm4c1_11 = instruction[11:7];
  assign u_imm31c12 = instruction[31:12];
  assign j_imm20_10c1_11_19c12 = instruction[31:12];
  assign aluc = instruction[30];
  assign ebit = instruction[20];

  rv32i_t name;
  
endinterface
