`ifndef SRAM_SEQUENCE_SV
`define SRAM_SEQUENCE_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "transaction.sv"

class sram_sequence extends uvm_sequence #(sram_transaction);
  `uvm_object_utils(sram_sequence)
  
  // sram_transaction tr;
  
  function new(string name = "sram_sequence");
    super.new(name);
  endfunction
  
  task body();
    sram_transaction tr;
    `uvm_info("SEQUENCE","Generating Memory Transactions", UVM_LOW)
    
    repeat(5) begin
    tr = sram_transaction::type_id::create("tr");
       start_item(tr);
      if (!tr.randomize())
        `uvm_error("SEQUENCE", "Randomization failed");
      finish_item(tr);
    end
  endtask
endclass
               
`endif
