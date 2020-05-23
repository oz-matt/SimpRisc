module umem(masterif.umem io)
  
  reg[31:0] umemory[0:255];
  
  initial begin
    $readmemb("mem.data", umemory);
  end
  
  always_ff @(posedge io.clk) begin
    if(io.mem_rw)
      umemory[io.mem_addr] <= io.mem_wdata;
  end
  
  always_comb
    io.mem_rdata = io.mem_rw ? 0 : umemory[io.mem_addr];
  
endmodule