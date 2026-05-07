`ifndef SRAM_TEST_SV
`define SRAM_TEST_SV

import uvm_pkg::*;          
`include "uvm_macros.svh"  


`include "environment.sv"
`include "sequence.sv"

class sram_test extends uvm_test;
  `uvm_component_utils(sram_test)
  
  environment e;
  sram_sequence seq;
  
  function new(string name = "sram_test", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e = environment::type_id::create("e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    sram_sequence seq;
    phase.raise_objection(this);
    
    seq = sram_sequence::type_id::create("seq");
    seq.start(e.agent.sequencer);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

`endif
