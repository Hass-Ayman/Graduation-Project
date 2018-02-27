`timescale 1ns/1ps
`define data_width (8)
`define ram_depth ((1024))
`define address_width ($clog2(`ram_depth))

module mem_tb();

	integer j;
	wire[`data_width-1:0] data;
	reg clk;
	reg we;
	reg[`address_width-1:0] address;
	reg cs;
	reg oe;
	reg[`data_width-1:0] data_out;

	//instantiation of the binding module
	binding_module bind1();

	//instantiation of the DUT
	ram_sp_sr_sw dut(.data(data), .clk(clk), .address(address), .we(we), .cs(cs), .oe(oe) );
	
	//intialization of the inputs
	initial begin
		clk<=0;
		we<=0;
		address<=0;
		cs<=0;
		oe<=0;
		#5;
	end
	
	//clock generation
	always
		#5  clk =  ! clk;
	
	assign data = (cs && we && !oe) ? data_out : 8'bz;
	
	initial begin
		//write operations
		cs<=1;we<=1;
		
		for(j=0;j<(0.15)*`ram_depth;j=j+1) begin
			@(negedge clk)
			address<=j;
			assign data_out=$urandom(j)%255;
		end
		#10;
		for(j=(0.4)*`ram_depth;j<(0.6)*`ram_depth;j=j+1) begin
			@(negedge clk)
			address<=j;
			assign data_out=$urandom(j)%255;
		end
		#10;
		for(j=(0.85)*`ram_depth;j<`ram_depth;j=j+1) begin
			@(negedge clk)
			address<=j;
			assign data_out=$urandom(j)%255;
		end
		#20;
		
		//Read Operations
		we<=0;oe<=1;
		
		for(j=0;j<(0.15)*`ram_depth;j=j+1) begin
			@(negedge clk)
			address<=j;
		end
		#10;
		for(j=(0.4)*`ram_depth;j<(0.6)*`ram_depth;j=j+1) begin
			@(negedge clk)
			address<=j;
		end
		#10;
		for(j=(0.85)*`ram_depth;j<`ram_depth;j=j+1) begin
			@(negedge clk)
			address<=j;
		end
		#20;
		
		$finish;
	end
endmodule


