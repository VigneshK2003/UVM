`ifndef DFF_MONITOR_SV
`define DFF_MONITOR_SV

`include "transaction.sv"
`include "interface.sv"

class dff_monitor extends uvm_monitor#(dff_transaction);
  `uvm_component_utils(dff_monitor)
  
   virtual dff_intf vif;
  
  uvm_analysis_port #(dff_transaction)dff_ap;
      dff_transaction tr;
  
  function new(string name = "dff_monitor", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual dff_intf)::get(this,"","vif",vif))
       `uvm_fatal("NO_VIF","virtual interface not found")
       dff_ap = new("dff_ap", this);
  endfunction
 
       task run_phase(uvm_phase phase);
          dff_transaction tr;
         forever begin
          tr = dff_transaction::type_id::create("tr");
          @(posedge vif.clk);
          #1;
          tr.rst = vif.rst;
          tr.d  = vif.d;
          tr.q  = vif.q;
           `uvm_info("MONITOR",$sformatf(tr.display()),UVM_LOW)
          dff_ap.write(tr);
          
         end
       endtask  
endclass
                     
`endif
