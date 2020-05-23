module cpu (
  input clk,
  input nreset
);
  
  masterif mif(.*);

  imem(mif.imem);
  umem(mif.umem);
  
  always_ff @(posedge clk) begin
    
  end
  
endmodule