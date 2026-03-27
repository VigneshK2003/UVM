`ifndef DFF_TEST_SV
`define DFF_TEST_SV

`include "environment.sv"
`include "sequence.sv"

class dff_test extends uvm_test;
  `uvm_component_utils(dff_test)
  
  environment e;
  dff_sequence seq;
  
  function new(string name = "environment", uvm_component parent = null);
    super.new(name,parent);
    `uvm_info("TEST","Environment created",UVM_LOW);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e = environment::type_id::create("e",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    dff_sequence seq;
    phase.raise_objection(this);
    seq = dff_sequence::type_id::create("seq",this);
    seq.start(e.agent.sequencer);
    phase.phase_done.set_drain_time(this,10ns); //time to finish the last transaction
    phase.drop_objection(this);
  endtask
endclass
