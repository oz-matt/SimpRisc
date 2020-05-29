module umem(masterif.umem io);
  
  reg[7:0] umemory[0:255];
  
  initial begin
    $readmemb("mem.data", umemory);
  end
  
  always @* begin
    if(io.mem_rw) begin
      case (instruction.funct3)
        
        3'b010: begin
          umemory[io.mem_addr] = io.mem_wdata[7:0];
          umemory[io.mem_addr + 1] = io.mem_wdata[15:8];
          umemory[io.mem_addr + 2] = io.mem_wdata[23:16];
          umemory[io.mem_addr + 3] = io.mem_wdata[31:24];
        end
        
        3'b001: begin
          umemory[io.mem_addr] = io.mem_wdata[7:0];
          umemory[io.mem_addr + 1] = io.mem_wdata[15:8];
        end
        
        3'b000: begin
          umemory[io.mem_addr] = io.mem_wdata[7:0];
        end
      
      endcase
    end
  end
  
  always_comb
    io.mem_rdata = io.mem_rw ? 0 : 
  {umemory[io.mem_addr + 3], 
   umemory[io.mem_addr + 2], 
   umemory[io.mem_addr + 1], 
       umemory[io.mem_addr]};
  
endmodule