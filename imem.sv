module imem(masterif.imem io);
  
  reg[31:0] imemory[0:255];
  
  initial begin
    $readmemb("prog.data", imemory);
  end
  
  always_comb
    io.instruction = imemory[io.pc];
  
endmodule
