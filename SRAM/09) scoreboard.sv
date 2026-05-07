`ifndef SRAM_SCOREBOARD_SV
`define SRAM_SCOREBOARD_SV

`include "transaction.sv"

class sram_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(sram_scoreboard)

  uvm_analysis_imp #(sram_transaction, sram_scoreboard) analysis_export;

  bit [7:0] mem [0:15];   

  function new(string name = "sram_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_export = new("analysis_export", this);
  endfunction

  function void write(sram_transaction tr);
    bit [7:0] exp_out;

    
    if (tr.we) begin
      mem[tr.addr] = tr.data_in;

      `uvm_info("SCB",
        $sformatf("WRITE : addr=%0d data_in=%0h",
                  tr.addr, tr.data_in),
        UVM_LOW)
    end

   
    else if(tr.re) begin
      exp_out = mem[tr.addr];
      

      if (exp_out == tr.data_out)
        `uvm_info("SCB",$sformatf("READ PASS : re = %d, we = %d, addr = %d, data_in = %d, data_out = %d",tr.re, tr.we,tr.addr,tr.data_in,tr.data_out),
          UVM_LOW)
      else
        `uvm_error("SCB",$sformatf("READ FAIL : re = %d, we = %d, addr = %d, data_in = %d, data_out = %d",tr.re, tr.we,tr.addr,tr.data_in,tr.data_out))
    end
  endfunction

endclass

`endif
