`ifndef SRAM_TRANSACTION_SV
`define SRAM_TRANSACTION_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

class sram_transaction extends uvm_sequence_item;
  `uvm_object_utils(sram_transaction)
    
    rand bit re;
    rand bit we;
    rand bit addr;
    rand bit data_in;
         bit data_out;
  
   constraint valid_rw {
  !(we && re);
}

  
  function new(string name = "sram_transaction");
    super.new(name);
  endfunction
  
   function string convert2string();
     return $sformatf("INPUT re = %d, we = %d, addr = %d, data_in = %d, OUTPUT data_out = %d",re,we,addr,data_in,data_out);
     
endfunction
  
endclass
  
`endif
