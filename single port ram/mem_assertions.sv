`define data_width (8)
`define ram_depth ((2**3))
`define address_width ($clog2(`ram_depth))


module mem_asserts(input wire clk_ip, we_ip, [`address_width-1:0] address_ip, [`data_width-1:0] data_ip);

	sequence read_0;
			(!we_ip && !data_ip);
	endsequence
	
	sequence read_1;
			(!we_ip && data_ip);
	endsequence
	
	sequence write_0;
			(we_ip && !data_ip);
	endsequence
	
	sequence write_1;
			(we_ip && data_ip);
	endsequence
	
	
		//Positive Testing
		//write 1 then read 1
		property write_1_read_1;
			@(posedge clk_ip) write_1 |=>  read_1;
		endproperty
		memory_write1_read1_error: assert property (write_1_read_1) $display("@%0dps Write 1 Read 1 Pass", $time);
															 	else $display("@%0dps Write 1 Read 1 Fail", $time);
		
		//write 0 then read 0
		property write_0_read_0;
			@(posedge clk_ip) write_0 |=> read_0;
		endproperty
		memory_write0_read0_error: assert property (write_0_read_0) $display("@%0dps Write 0 Read 0 Pass", $time);
															 	else $display("@%0dps Write 0 Read 0 Fail", $time);
		
		
		
		
	//Negative Testing
	//write 1 then read 0
/*		property write_1_read_0;
			@(posedge clk_ip) write_1 |=> read_0;
		endproperty
		memory_write1_read0_error: assert property (write_1_read_0)
															 	else $display("@%0dns Assertion Failed", $time);
		
	//write 0 then read 1
		property write_0_read_1;
			@(posedge clk_ip) write_0 |=> read_1;
		endproperty
		memory_write0_read1_error: assert property (write_0_read_1)
															 	else $display("@%0dns Assertion Failed", $time);*/
	
endmodule

