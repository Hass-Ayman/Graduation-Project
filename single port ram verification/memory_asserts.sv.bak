`timescale 1ns/1ps
`define DATA_WIDTH (8)
`define RAM_DEPTH (1024*1024*1024)
`define ADDRESS_WIDTH (30)

module mem_asserts(
	input wire clk,
 	input wire we,
  input wire [`ADDRESS_WIDTH-1:0] address,
  input wire [`DATA_WIDTH-1:0] data,
  input wire cs, 
  input wire oe);

//scoreboard associative array
reg [`DATA_WIDTH+`ADDRESS_WIDTH-1:0] scoreboard [*];

//temporary array for comparison
reg [`DATA_WIDTH+`ADDRESS_WIDTH-1:0] temp;

wire scoreboard_exists;
assign scoreboard_exists=scoreboard.exists(address);

//writing in the scoreboard when writing to memory
always@ (posedge clk) begin
	if(we&&cs&&!oe) scoreboard [address] = {data,address};//can't use non blocking assignment with associative array
end

//temporary transition to compare the values
always@ (posedge clk) begin
	if(!we&&cs&&oe) temp <= scoreboard [address];
end

//read after write
assert property (@(posedge clk) ( !we && cs && oe && scoreboard_exists ) |-> ({data,address}==temp )) $display("@%0dns Assertion Pass scoreboard(data)=%h,data=%h,scoreboard(address)=%h,address=%h",$time,temp[`DATA_WIDTH+`ADDRESS_WIDTH-1:`ADDRESS_WIDTH],data,temp[`ADDRESS_WIDTH-1:0],address); else $display("@%0dns Assertion Fail scoreboard(data)=%h,data=%h,scoreboard(address)=%h,address=%h",$time,temp[`DATA_WIDTH+`ADDRESS_WIDTH-1:`ADDRESS_WIDTH],data,temp[`ADDRESS_WIDTH-1:0],address);

//read before write
assert property (@(posedge clk) not ( !we && cs && oe && !scoreboard_exists ));

//overwrite the written data
//assert property(@(posedge clk) ( we && cs && !oe && scoreboard_exists ));

//invalid data
assert property(@(posedge clk) (!we && cs && oe) |-> ((^address !==1'bx )&&(^data !==1'bx)));

endmodule