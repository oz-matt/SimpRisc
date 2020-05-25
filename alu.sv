module alu(masterif.alu io);

  always_comb begin 
    case(io.alu_sel)
      ALU_ADD: io.alu_out = io.alu_a + io.alu_b;
      ALU_SUB: io.alu_out = io.alu_a - io.alu_b;
      ALU_NOT: io.alu_out = ~a;
      ALU_LS: io.alu_out = io.alu_a << io.alu_b;
      ALU_RS: io.alu_out = io.alu_a >> io.alu_b;
      ALU_AND: io.alu_out = io.alu_a & io.alu_b;
      ALU_OR: io.alu_out = io.alu_a | io.alu_b;
      ALU_LT: 
        if (io.alu_a < io.alu_b) io.alu_out = 32'd1;
        else io.alu_out = 32'd0;
      default: io.alu_out = io.alu_a + io.alu_b;
    endcase
  end
  
endmodule