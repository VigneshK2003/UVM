`ifndef SRAM_INTERFACE_SV
`define SRAM_INTERFACE_SV

interface sram_intf;
       logic clk;
       logic re;
       logic we;
       logic addr;
       logic data_in;
       logic data_out;
endinterface

`endif
