// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : generated_tb
//
// File Name: top_tb.sv
//
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Thu Aug 27 09:04:06 2020
//=============================================================================
// Description: Testbench
//=============================================================================

`include "top_th.sv"

module top_tb;

  timeunit      1ns;
  timeprecision 1ps;

  integer i;

  real s, maxv, vwr;

  top_th th();

  top amstop(s, maxv, vwr);

  // You can insert code here by setting tb_inc_inside_module in file common.tpl

  // You can remove the initial block below by setting tb_generate_run_test = no in file common.tpl

  initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars;
    //$fsdbDumpfile("novas.fsdb");
    //$fsdbDumpvars();
    //$fsdbDumpon;
    //#200;
    $display("done!!!!!!!!!!");
for(i=0;i<100;i=i+1) begin
    #1;
    $display("freq s: %e, mag : %e, vramp: %e", s, maxv, vwr);
  end
  $finish;

  end

endmodule

