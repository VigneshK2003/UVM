`timescale 1ns/1ps

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "interface.sv"
`include "test.sv"

module full_adder_tb;

  fa_intf intf();

  full_adder dut (
    .a(intf.a),
    .b(intf.b),
    .c(intf.c),
    .sum(intf.sum),
    .carry(intf.carry)
  );

 // uvm_root root;
  initial begin
    uvm_config_db#(virtual fa_intf)::set(null, "*", "vif", intf);
//     uvm_root root;
//     root = uvm_root::get();
//     root.run_test("fa_test");
    run_test("fa_test");
  end

  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0, full_adder_tb);
  end

endmodule
