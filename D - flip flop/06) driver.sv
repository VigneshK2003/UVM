`ifndef DFF_DRIVER_SV
`define DFF_DRIVER_SV

`include "transaction.sv"
`include "interface.sv"

class dff_driver extends uvm_driver #(dff_transaction);
  `uvm_component_utils(dff_driver)
  
  virtual dff_intf vif;
  
  function new(string name = "dff_driver",uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual dff_intf)::get(this,"","vif",vif))
         `uvm_fatal("NO_VIF", "Virtual interface not found in Driver")
  endfunction
       
    task run_phase(uvm_phase phase);
       forever begin
         seq_item_port.get_next_item(req);
         driver(req);
         seq_item_port.item_done();
       end
    endtask
       
    task driver(dff_transaction tr);
       
      @(negedge vif.clk);
        vif.d   <= tr.d;
        vif.rst <= tr.rst;
       @(vif.driv_cb);  
      `uvm_info("DRV",$sformatf("rst = %d | d = %d | q = %d", tr.rst,tr.d,tr.q), UVM_LOW)
      
       endtask
endclass
       
`endif
