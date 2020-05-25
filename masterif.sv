interface masterif (
  input logic clk,
  input logic nreset
);
  
  logic[31:0] rx [31:0];
  logic[31:0] pc;
  
  logic[31:0] instruction;
  
  logic[31:0] mem_wdata;
  logic[31:0] mem_rdata;
  logic[31:0] mem_addr;
  logic mem_rw;
  
  logic[31:0] alu_a;
  logic[31:0] alu_b;
  logic[31:0] alu_out;
  logic[2:0] alu_sel;
  
  always @(posedge clk) begin
    if (pc) pc<=0;
    else pc<=1;
  end
  
  modport imem (
    input pc,
    output instruction,
    input nreset
  );
  
  modport umem (
    input clk,
    input mem_wdata,
    output mem_rdata,
    input mem_addr,
    input mem_rw
  );
  
  modport alu (
    input clk,
    input alu_a,
    input alu_b,
    output alu_out,
    input alu_sel
  );
  
endinterface
