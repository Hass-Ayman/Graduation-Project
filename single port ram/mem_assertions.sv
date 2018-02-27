`timescale 1ns/1ps
`define data_width (8)
`define ram_depth ((1024))
`define address_width ($clog2(`ram_depth))

module mem_asserts(
	input clk_ip,
 	input we_ip,
  input int address_ip,
  input int data_ip,
  input cs_ip, 
  input oe_ip);

int mem_array[*];
wire mem_array_exists;
assign mem_array_exists=mem_array.exists(address_ip);

always@ (posedge clk_ip)
	if(we_ip&&cs_ip&&!oe_ip) mem_array[address_ip] = data_ip;

//read_after_write
assert property (@(posedge clk_ip) ( !we_ip && mem_array_exists ) |-> (mem_array[address_ip]==data_ip));

//read_before_write
assert property (@(posedge clk_ip) not( !we_ip && !mem_array_exists ));

endmodule