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
    disp_rx(cpu_inst.mif.rx);
    $finish;
  end
  
endmodule

function void disp_rx(input logic[31:0] h[31:0]);
  $display("rx[0]: %X", h[0]);
  $display("rx[1]: %X", h[1]);
  $display("rx[2]: %X", h[2]);
endfunction
