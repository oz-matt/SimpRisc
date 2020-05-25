module imem(masterif.imem io);
  
  bit[31:0] imemory[0:255];
  
  initial begin
    $readmemb("prog.data", imemory);
    $display("imem0:%X", imemory[0]);
  end
  
  always_comb
    io.instruction = imemory[io.pc];
  
endmodule
