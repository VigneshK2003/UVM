`ifndef SRAM_SEQUENCER_SV
`define SRAM_SEQUENCER_SV

`include "transaction.sv"

class sram_sequencer extends uvm_sequencer#(sram_transaction);
  `uvm_component_utils(sram_sequencer)
  
  function new(string name = "sram_sequencer", uvm_component parent = null);
    super.new(name, parent);
    `uvm_info("SEQUENCER", "Sequencer Created", UVM_LOW)
  endfunction
endclass

`endif
