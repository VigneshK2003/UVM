`ifndef fa_scoreboard_sv
`define fa_scoreboard_sv

`include "transaction.sv"

class fa_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(fa_scoreboard)
  
  uvm_analysis_imp #(fa_transaction, fa_scoreboard) analysis_export;
  
  function new(string name = "fa_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_export = new("analysis_export", this);
  endfunction
  
  function void write(fa_transaction tr);
    bit exp_sum;
    bit exp_carry;
    
    exp_sum = tr.a ^ tr.b ^ tr.c;
    exp_carry = (tr.a & tr.b)|(tr.b & tr.c)|(tr.a & tr.c);
    
    if(tr.sum !== exp_sum || tr.carry !== exp_carry) begin
      `uvm_error("SCB", $sformatf("MISMATCH! Input: a=%b, b=%b, c=%b | Expected: sum=%b, carry=%b | Actual: sum=%b, carry=%b",tr.a, tr.b,tr.c, exp_sum, exp_carry, tr.sum, tr.carry))
        end else begin
          `uvm_info("SCB", $sformatf("PASS! Input: a=%b, b=%b, c=%b | Output: sum=%b, carry=%b",tr.a, tr.b,tr.c, tr.sum, tr.carry), UVM_LOW)
        end
  endfunction
endclass

    
`endif
