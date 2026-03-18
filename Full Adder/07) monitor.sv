`ifndef fa_monitor_sv
`define fa_monitor_sv

`include "transaction.sv"
`include "interface.sv"

class fa_monitor extends uvm_monitor;
  `uvm_component_utils(fa_monitor)
  
  virtual fa_intf vif;
  
  uvm_analysis_port #(fa_transaction) ap;
  fa_transaction tr;
  
  function new(string name = "fa_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual fa_intf)::get(this, "", "vif", vif))
      `uvm_fatal("NO_VIF", "Virtual interface not found in Monitor")
      ap = new("ap", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    fa_transaction tr;
    repeat(5) begin
      @(vif.drv_done);
       tr = fa_transaction::type_id::create("tr");
       tr.a = vif.a;
       tr.b = vif.b;
       tr.c = vif.c;
      tr.sum = vif.sum;
      tr.carry = vif.carry;
      ap.write(tr);
      `uvm_info("MON", $sformatf("Monitored: %s", tr.convert2string()), UVM_LOW)
    end
  endtask
endclass

`endif
