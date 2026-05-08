`ifndef SRAM_ENVIRONMENT_SV
`define SRAM_ENVIRONMENT_SV

import uvm_pkg::*;         
`include "uvm_macros.svh"

`include "agent.sv"
`include "scoreboard.sv"

class environment extends uvm_env;
  `uvm_component_utils(environment)
  
  sram_agent agent;
  sram_scoreboard scb;
  
  function new(string name = "environment", uvm_component parent = null);
    super.new(name, parent);
    `uvm_info("ENV", "Environment Created", UVM_LOW)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = sram_agent::type_id::create("agent", this);
    scb = sram_scoreboard::type_id::create("scb", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.mon_ap.connect(scb.analysis_export);
  endfunction
endclass

`endif
