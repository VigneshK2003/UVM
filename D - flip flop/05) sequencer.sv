`ifndef DFF_SEQUENCER_SV
`define DFF_SEQUENCER_SV

`include "transaction.sv"

class dff_sequencer extends uvm_sequencer #(dff_transaction);
  `uvm_component_utils(dff_sequencer)
  
  function new(string name = "dff_sequencer", uvm_component parent = null);
    super.new(name,parent);
     `uvm_info("SEQUENCER", "Sequencer Created", UVM_LOW)
  endfunction
endclass

`endif
