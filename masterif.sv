interface masterif (
  input logic clk,
  input logic nreset
);
  
  logic[31:0] rx [31:0];
  logic[31:0] pc = 32'h80000000;
  
  logic[31:0] instruction;
  
  logic[31:0] mem_wdata;
  logic[31:0] mem_rdata;
  bit[31:0] mem_addr;
  logic mem_rw;
  
  modport umem (
    input clk,
    input pc,
    output instruction,
    input mem_wdata,
    output mem_rdata,
    input mem_addr,
    input mem_rw
  );
  
endinterface