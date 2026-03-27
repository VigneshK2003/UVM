`ifndef DFF_ENVIRONMENT_SV
`define DFF_ENVIRONMENT_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "agent.sv"
`include "scoreboard.sv"

class environment extends uvm_env;
  `uvm_component_utils(environment)
  
    dff_agent agent;
    dff_scoreboard scb;
  
  function new(string name = "environment", uvm_component parent = null);
    super.new(name,parent);
    `uvm_info("ENV", "Environment Created", UVM_LOW)
  endfunction
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = dff_agent::type_id::create("agent", this);
    scb = dff_scoreboard::type_id::create("scb", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    agent.monitor.dff_ap.connect(scb.a_export);
  endfunction
endclass
