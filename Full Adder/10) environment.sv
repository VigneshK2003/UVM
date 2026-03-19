`ifndef fa_environment_sv
`define fa_environment_sv

import uvm_pkg::*;         
`include "uvm_macros.svh"

`include "agent.sv"
`include "scoreboard.sv"

class environment extends uvm_env;
  `uvm_component_utils(environment)
  
  fa_agent agent;
  fa_scoreboard scb;
  
  function new(string name = "environment", uvm_component parent = null);
    super.new(name, parent);
    `uvm_info("ENV", "Environment Created", UVM_LOW)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = fa_agent::type_id::create("agent", this);
    scb = fa_scoreboard::type_id::create("scb", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    agent.monitor.ap.connect(scb.analysis_export);
  endfunction
endclass

`endif
