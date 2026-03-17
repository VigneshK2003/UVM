`ifndef fa_transaction_sv
`define fa_transaction_sv

import uvm_pkg::*;
`include "uvm_macros.svh"

class fa_transaction extends uvm_sequence_item;
  `uvm_object_utils(fa_transaction)
  
     rand bit a;
     rand bit b;
     rand bit c;
      bit sum;
      bit carry;
  
  function new(string name = "fa_transaction");
      super.new(name);
    endfunction
  
   function string convert2string();
     return $sformatf("INPUT A = %d, B = %d, C = %d, OUTPUT SUM = %d, CARRY = %d",a, b, c, sum, carry);
endfunction
  
endclass
  
`endif
