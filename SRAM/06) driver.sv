`ifndef SRAM_DRIVER_SV
`define SRAM_DRIVER_SV

`include "transaction.sv"
`include "interface.sv"

class sram_driver extends uvm_driver #(sram_transaction);
  `uvm_component_utils(sram_driver)
  
  virtual sram_intf vif;
  
  function new(string name = "sram_driver", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual sram_intf)::get(this,"", "vif", vif))
      `uvm_fatal("NO_VIF", "Virtual interface not found in Driver")
  endfunction
      
      
  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      driver(req);
      seq_item_port.item_done();
    end
  endtask
  
    task driver(sram_transaction tr);
    #10;
    vif.re <= tr.re;
    vif.we <= tr.we;
    vif.addr <= tr.addr;
    vif.data_in <= tr.data_in;
   
    `uvm_info("DRV", $sformatf("Driving: INPUT re = %d, we = %d, addr = %d,data_in = %d", tr.re,tr.we,tr.addr,tr.data_in), UVM_LOW)
   // #5;
  endtask
endclass

`endif
