`ifndef DFF_SCOREBOARD_SV
`define DFF_SCOREBOARD_SV

`include "transaction.sv"

class dff_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(dff_scoreboard)
  
  uvm_analysis_imp #(dff_transaction,dff_scoreboard)a_export;
  
  function new(string name = "dff_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    a_export = new("a_export",this);
  endfunction
  
  function void write(dff_transaction tr);
        bit exp_q;
       
    if(tr.rst==1)
       exp_q = 1'b0;
     else 
       exp_q = tr.d;
    
    if(exp_q == tr.q)
      `uvm_info("SCB",$sformatf("rst = %d | d = %d | q = %d", tr.rst,tr.d,tr.q),UVM_LOW)
    else
      //`uvm_error("SCB",$sformatf("scoreboard condition failed"),UVM_LOW)
       `uvm_error("SCB",$sformatf("rst = %d | d = %d | q = %d", tr.rst,tr.d,tr.q))
  endfunction
endclass
      
`endif
