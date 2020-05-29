interface masterif (
  input logic clk,
  input logic nreset
);
  
  logic[31:0] rx [31:0];
  logic[31:0] pc;
  
  wire[31:0] rx1;
  wire[31:0] rx2;
  wire[31:0] rx3;
  assign rx1=rx[1];
  assign rx2=rx[2];
  assign rx3=rx[3];
  
  logic[31:0] instruction;
  
  logic[31:0] mem_wdata;
  logic[31:0] mem_rdata;
  logic[31:0] mem_addr;
  logic mem_rw;
  
  modport imem (
    input pc,
    output instruction,
    input nreset
  );
  
  modport umem (
    input clk,
    input instruction,
    input mem_wdata,
    output mem_rdata,
    input mem_addr,
    input mem_rw
  );
  
endinterface
