`ifndef DFF_SEQUENCE_SV
`define DFF_SEQUENCE_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "transaction.sv"

class dff_sequence extends uvm_sequence#(dff_transaction);
   `uvm_object_utils(dff_sequence)
  
  function new(string name = "dff_sequence");
    super.new(name);
  endfunction
  
  task body();
    dff_transaction tr;
    
    repeat(5)begin
      tr = dff_transaction::type_id::create("tr");
      start_item(tr);
      if(!tr.randomize()) `uvm_error("SEQ","randomization failed");
      finish_item(tr);
    end
  endtask
endclass
                 
`endif
