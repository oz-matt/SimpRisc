module tb();
  logic clk, nreset;
  
  initial begin
    clk <= 0;
    forever #1 clk <= !clk;
  end
  
  cpu cpu_inst(clk, nreset);
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    
    nreset <= 0;
    #4
    nreset <= 1;
    
    
    #20;
    $finish;
  end
  
endmodule