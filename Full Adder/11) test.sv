`ifndef fa_test_sv
`define fa_test_sv

import uvm_pkg::*;          
`include "uvm_macros.svh"  


`include "environment.sv"
`include "sequence.sv"

class fa_test extends uvm_test;
  `uvm_component_utils(fa_test)
  
  environment e;
  fa_sequence seq;
  
  function new(string name = "fa_test", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e = environment::type_id::create("e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    fa_sequence seq;
    phase.raise_objection(this);
    
    seq = fa_sequence::type_id::create("seq");
    seq.start(e.agent.sequencer);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

`endif
