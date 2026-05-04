`ifndef SRAM_MONITOR_SV
`define SRAM_MONITOR_SV

`include "transaction.sv"
`include "interface.sv"

class sram_monitor extends uvm_monitor #(sram_transaction);
  `uvm_component_utils(sram_monitor)
  
   virtual sram_intf vif;
   
  uvm_analysis_port #(sram_transaction) mon_ap;
   sram_transaction tr;
  
  function new(string name = "sram_monitor", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual sram_intf)::get(this,"","vif",vif))
       `uvm_fatal("NO_VIF", "Virtual interface not found in Monitor")
       mon_ap = new("mon_ap", this);
  endfunction
       
  
  task run_phase(uvm_phase phase);
    sram_transaction tr;
    repeat(5) begin
       tr = sram_transaction::type_id::create("tr");
      #11;
       tr.re = vif.re;
       tr.we = vif.we;
       tr.addr = vif.addr;
      tr.data_in = vif.data_in;
      tr.data_out = vif.data_out;
      mon_ap.write(tr);
      `uvm_info("MON", $sformatf("Monitor: %s", tr.convert2string()), UVM_LOW)
    end
  endtask
endclass

`endif
