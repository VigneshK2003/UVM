`ifndef DFF_INTERFACE_SV
`define DFF_INTERFACE_SV

interface dff_intf(input logic clk);
    logic d;
    logic q;
    logic rst;
  
  clocking driv_cb@(negedge clk);
       output rst;
       output d;
  endclocking
  
  clocking mon_cb@(posedge clk);
       input rst;
       input d;
       input q;
  endclocking
      
endinterface

`endif
