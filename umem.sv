module umem(masterif.umem io);
  
  reg[7:0] umemory[0:255];
  
  initial begin
    $readmemb("mem.data", umemory);
  end
  
  always @(posedge io.clk) begin
    if(io.mem_rw)
      umemory[io.mem_addr] <= io.mem_wdata;
  end
  
  always_comb
    io.mem_rdata = io.mem_rw ? 0 : 
      {umemory[io.mem_addr], 
       umemory[io.mem_addr + 1], 
       umemory[io.mem_addr + 2], 
       umemory[io.mem_addr + 3]};
  
endmodule