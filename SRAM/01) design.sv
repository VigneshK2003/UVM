// SRAM design code

module sram #(parameter ADDR_WIDTH = 4,
              parameter DATA_WIDTH = 8)(
  
           input   clk,
           input   re,
           input   we,
  input [ADDR_WIDTH-1:0]   addr,
  input [DATA_WIDTH-1:0]   data_in,
  output reg [DATA_WIDTH-1:0] data_out
);
  
  reg [DATA_WIDTH-1:0] mem[0:(1<<ADDR_WIDTH)-1];
  
  always@(posedge clk) begin
  if(we) 
    mem[addr] <= data_in;
  end
  
  always@(posedge clk) begin
  if(re)
    data_out <= mem[addr];
  end
endmodule
