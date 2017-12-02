`define data_width (8)
`define ram_depth ((2**3))
`define address_width ($clog2(`ram_depth))
module mem(
		   we, //write enable
		   data, //in-out data
		   address, //address bus
		   clk, //clock input
);


	//input signals
	input clk;
	input we;
	input[`address_width-1:0] address;
	
	//inout signal
	inout[`data_width-1:0] data;

	//internal variables
	reg[`data_width-1:0] data_out;
	reg[`data_width-1:0] mem [0:`ram_depth-1]; //our memory consists of rows as memory depth and columns as width {memory(depth x width)}


	//tri state buffer output controller
	//output activated when read is activated (we=0)
	assign data = (!we) ? data_out : 8'bz;


	// Memory Write Block
	//write when we is activated and at clk positive edge
	always @(posedge clk) begin :mem_wr
		if (we) begin
			mem[address] = data;
		end
	end


	// Memory Read Block
	// read when we is zero and at clk positive edge
	always @(posedge clk) begin : mem_re
		if (!we) begin
			data_out = mem[address];
		end
	end

endmodule

