module umem(masterif.umem io,
            aximem.mem mem);
  
  reg[7:0] umemory[0:255];
  
  initial begin
    //$readmemb("mem.data", umemory);
    umemory[0] = 8'h11;
    umemory[1] = 0;
    umemory[2] = 3;
    umemory[3] = 0;
    
    umemory[4] = 3;
    umemory[5] = 0;
    umemory[6] = 0;
    umemory[7] = 0;
    
    umemory[8] = 8'h99;
    umemory[9] = 8'haa;
    umemory[10] = 8'hbb;
    umemory[11] = 8'hcc;
    
    umemory[12] = 4;
    umemory[13] = 0;
    umemory[14] = 0;
    umemory[15] = 0;
    if(mem.axi_mem_w) umemory[15] = 0;
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
  
  
  
  always @* begin
    if(mem.axi_mem_w) begin
      umemory[mem.axi_mem_addr] = mem.axi_mem_data[7:0];
      umemory[mem.axi_mem_addr + 1] = mem.axi_mem_data[15:8];
      umemory[mem.axi_mem_addr + 2] = mem.axi_mem_data[23:16];
      umemory[mem.axi_mem_addr + 3] = mem.axi_mem_data[31:24];
    end
  end
  
endmodule