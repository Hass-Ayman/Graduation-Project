`timescale 1ns/1ps
`define data_width (8)
`define ram_depth ((2**3))
`define address_width ($clog2(`ram_depth))

module mem_tb();


	integer i;
	wire[`data_width-1:0] data;
	reg clk;
	reg we;
	reg[`address_width-1:0] address;
	reg[`data_width-1:0] data_out;


	//Instantiation of the binding file
	binding_module bind1();


	//Instantiation of the RAM module and connect the ports
	mem dut(.data(data), .clk(clk), .address(address), .we(we));


	assign data = (we) ? data_out : 8'bz;

	initial begin
		clk = 1'b1;
		forever
			#50 clk = ~clk;
	end

	task write();
		begin
			we = 1'b1;
		end
	endtask

	task read();
		begin
			we = 1'b0;
		end
	endtask

	task stimulus(input[`address_width:0] i, input[`data_width:0] j);
		begin
			address = i;
			data_out = j;
		end
	endtask


	initial begin
		
		//write 0 then read 0 with up addressing order
		for (i = 0; i < `ram_depth; i = i + 1) begin
			@(negedge clk)
				write;
				stimulus(i, 8'h00);
			@(negedge clk)
				read;
				address = i;	
		end
		
		#50;

		
		//write 1 then read 1 with up addressing order
		for (i = 0; i < `ram_depth; i = i + 1) begin
			@(negedge clk)
				write;
				stimulus(i, 8'hff);
			@(negedge clk)
				read;
				address = i;	
		end
		
		
		#50;

		
		//write 0 then read 0 with down addressing order
		for (i = `ram_depth -1; i >= 0; i = i - 1) begin
			@(negedge clk)
				write;
				stimulus(i, 8'h00);
			@(negedge clk)
				read;
				address = i;
		end
		
		#50;

		
		//write 1 then read 1 with down addressing order
		for (i = `ram_depth -1; i >= 0; i = i - 1) begin
			@(negedge clk)
				write;
				stimulus(i, 8'hff);
			@(negedge clk)
				read;
				address = i;
		end
		
		#100;
		$finish;
	end
endmodule


