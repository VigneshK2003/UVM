`ifndef fa_driver_sv
`define fa_driver_sv

`include "transaction.sv"
`include "interface.sv"

class fa_driver extends uvm_driver #(fa_transaction);
  `uvm_component_utils(fa_driver)
  
  virtual fa_intf vif;
  
  function new(string name = "fa_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual fa_intf)::get(this,"", "vif", vif))
      `uvm_fatal("NO_VIF", "Virtual interface not found in Driver")
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      driver(req);
      seq_item_port.item_done();
    end
  endtask
  
    task driver(fa_transaction tr);
    vif.a <= tr.a;
    vif.b <= tr.b;
    vif.c <= tr.c;
    #10;
    
    -> vif.drv_done;
      `uvm_info("DRV", $sformatf("Driving: INPUT a = %d, b = %d, c = %d", tr.a,tr.b,tr.c), UVM_LOW)
 
  endtask
endclass

`endif
