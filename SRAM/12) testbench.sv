`timescale 1ns/1ps

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "interface.sv"
`include "test.sv"

module sram_tb;

  sram_intf intf();

  sram dut(
    .re(intf.re),
    .we(intf.we),
    .addr(intf.addr),
    .data_in(intf.data_in),
    .data_out(intf.data_out)
  );

  initial begin
    uvm_config_db#(virtual sram_intf)::set(null, "*", "vif", intf);
    run_test("sram_test");
  end

  initial begin
    $dumpfile("sram.vcd");
    $dumpvars(0, sram_tb);
  end

endmodule
