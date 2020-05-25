`include "masterif.sv"
`include "defines.sv"
`include "instruction_parser.sv"
`include "imem.sv"
`include "umem.sv"
  
module cpu (
  input clk,
  input nreset
);

  masterif mif(.*);

  imem(mif.imem);
  umem(mif.umem);
  

  instruction_parser instruction(mif.instruction);
  
  always_comb begin
    casex ({instruction.aluc, instruction.funct3, instruction.opcode})
      11'bxxxx0110111: instruction.name = LUI;
      11'bxxxx0010111: instruction.name = AUIPC;
      11'bxxxx1101111: instruction.name = JAL;
      11'bx0001100111: instruction.name = JALR;
      11'bx0001100011: instruction.name = BEQ;
      11'bx0011100011: instruction.name = BNE;
      11'bx1001100011: instruction.name = BLT;
      11'bx1011100011: instruction.name = BGE;
      11'bx1101100011: instruction.name = BLTU;
      11'bx1111100011: instruction.name = BGEU;
      11'bx0000000011: instruction.name = LB;
      11'bx0010000011: instruction.name = LH;
      11'bx0100000011: instruction.name = LW;
      11'bx1000000011: instruction.name = LBU;
      11'bx1010000011: instruction.name = LHU;
      11'bx0000100011: instruction.name = SB;
      11'bx0010100011: instruction.name = SH;
      11'bx0100100011: instruction.name = SW;
      11'bx0000010011: instruction.name = ADDI;
      11'bx0100010011: instruction.name = SLTI;
      11'bx0110010011: instruction.name = SLTIU;
      11'bx1000010011: instruction.name = XORI;
      11'bx1100010011: instruction.name = ORI;
      11'bx1110010011: instruction.name = ANDI;
      11'b00010010011: instruction.name = SLLI;
      11'b01010010011: instruction.name = SRLI;
      11'b11010010011: instruction.name = SRAI;
      11'b00000110011: instruction.name = ADD;
      11'b10000110011: instruction.name = SUB;
      11'b00010110011: instruction.name = SLL;
      11'b00100110011: instruction.name = SLT;
      11'b00110110011: instruction.name = SLTU;
      11'b01000110011: instruction.name = XOR;
      11'b01010110011: instruction.name = SRL;
      11'b11010110011: instruction.name = SRA;
      11'b01100110011: instruction.name = OR;
      11'b01110110011: instruction.name = AND;
      11'bx0000001111: instruction.name = FENCE;
      11'b00001110011: 
        if(instruction.ebit == 1'b1)
          instruction.name = EBREAK;
        else
          instruction.name = ECALL;
      default: instruction.name = NOP;
    endcase    
  end
  
  logic k;
  always @(posedge mif.clk)
  begin
    if(mif.pc!=1) mif.pc <= 1;
    else mif.pc <= 0;
  end
  
  always_comb begin
    if(!mif.nreset) mif.rx = '{default:32'h00000000};
    else begin
      case (instruction.name)
        
        LW: begin //Load 32-bit val at umem[rx[rs1] + imm] into rd
          mif.mem_rw = 0;
          mif.mem_addr = mif.rx[instruction.rs1] + instruction.i_imm11c0;
          mif.rx[instruction.rd] = mif.mem_rdata;
        end
        
        LH: begin //Load 16-bit val (sign extended to 32-bits) at umem[rx[rs1] + imm] into rd
          mif.mem_rw = 0;
          mif.mem_addr = mif.rx[instruction.rs1] + instruction.i_imm11c0;
          if(mif.mem_rdata[15] == 1)
            mif.rx[instruction.rd] = {16'hFF, mif.mem_rdata[15:0]};
          else
            mif.rx[instruction.rd] = {16'h00, mif.mem_rdata[15:0]};
        end
        
        LHU: begin //Load 16-bit val (zero extended to 32-bits) at umem[rx[rs1] + imm] into rd
          mif.mem_rw = 0;
          mif.mem_addr = mif.rx[instruction.rs1] + instruction.i_imm11c0;
          mif.rx[instruction.rd] = {16'h00, mif.mem_rdata[15:0]};
        end
        
        LB: begin //Load 8-bit val (sign extended to 32-bits) at umem[rx[rs1] + imm] into rd
          mif.mem_rw = 0;
          mif.mem_addr = mif.rx[instruction.rs1] + instruction.i_imm11c0;
          if(mif.mem_rdata[7] == 1)
            mif.rx[instruction.rd] = {24'hFFF, mif.mem_rdata[7:0]};
          else
            mif.rx[instruction.rd] = {24'h000, mif.mem_rdata[7:0]};
        end
        
        LBU: begin //Load 8-bit val (zero extended to 32-bits) at umem[rx[rs1] + imm] into rd
          mif.mem_rw = 0;
          mif.mem_addr = mif.rx[instruction.rs1] + instruction.i_imm11c0;
          mif.rx[instruction.rd] = {24'h000, mif.mem_rdata[7:0]};
        end
        
        ADDI: k=0;
      
      endcase
    end
  end
  
  
        //$display("lw: addr:%X, rs1:%X, rd:%X, imm:%X, rdata:%X, full:%X, res:%X", mif.mem_addr, instruction.rs1, instruction.rd, instruction.i_imm11c0, mif.mem_rdata, mif.instruction, mif.rx[instruction.rd]);
  
endmodule