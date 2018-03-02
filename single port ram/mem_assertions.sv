`timescale 1ns/1ps
`define data_width (8)
`define ram_depth ((1024))
`define address_width ($clog2(`ram_depth))

module mem_asserts(
	input wire clk_ip,
 	input wire we_ip,
  input wire [`address_width-1:0] address_ip,
  input wire [`data_width-1:0] data_ip,
  input wire cs_ip, 
  input wire oe_ip);

//scoreboard register
reg [`data_width-1:0] scoreboard [0:`ram_depth-1];
//writing in the scoreboard when writing to memory
always@ (posedge clk_ip)
	if(we_ip&&cs_ip&&!oe_ip) scoreboard [address_ip] <= data_ip;

//read after write
assert property (@(posedge clk_ip) ( !we_ip && cs_ip && oe_ip) |-> @(negedge clk_ip) (data_ip==scoreboard [address_ip]));

//data can't change between two positive edges if we are only reading or writing
assert property (@(posedge clk_ip) (cs_ip&&$stable(we_ip)) |-> (data_ip==$past(data_ip,0)));

endmodule