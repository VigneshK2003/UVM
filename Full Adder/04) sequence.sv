`ifndef FA_SEQUENCE_SV
`define FA_SEQUENCE_SV

import uvm_pkg::*;          
`include "uvm_macros.svh"  


`include "transaction.sv"

class fa_sequence extends uvm_sequence#(fa_transaction);
  `uvm_object_utils(fa_sequence)
  
  function new(string name = "fa_sequence");
    super.new(name);
  endfunction
                 
  task body();
    fa_transaction tr;
    `uvm_info("SEQUENCE","Generating Full Adder Transactions", UVM_LOW)
    
    repeat(5) begin
      tr = fa_transaction::type_id::create("tr");
      start_item(tr);
      if (!tr.randomize())
        `uvm_error("SEQUENCE", "Randomization failed");
      finish_item(tr);
    end
  endtask
endclass
               
`endif
