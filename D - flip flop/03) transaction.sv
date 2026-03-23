`ifndef DFF_TRANSACTION_SV
`define DFF_TRANSACTION_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

class dff_transaction extends uvm_sequence_item;
  `uvm_object_utils(dff_transaction)
  
   rand bit rst;
   rand bit d;
        bit q;
  
  constraint rst_c{rst->d==0;
                  solve rst before d;}
  
  function new(string name = "dff_transaction");
    super.new(name);
  endfunction
  
  function string display();
    return $sformatf(" rst = %d | d = %d | q = %d", rst,d,q);
  endfunction
endclass

`endif
