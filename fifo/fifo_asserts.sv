`define DATA_WIDTH (8)
`define RAM_DEPTH (1024*1024*1024)

module fifo_asserts(
 input clk ,
 input rst ,
 input wr_cs ,
 input rd_cs ,
 input rd_en ,
 input wr_en ,
 input [`DATA_WIDTH-1:0] data_in ,
 input full ,
 input empty,
 input [`DATA_WIDTH-1:0] data_out) ;
 

 integer count;
 
//full and empty
always@ (posedge clk  or posedge rst) begin 
	if (rst) count=0;
	else if(wr_en && wr_cs) count++;
	else if(rd_en && rd_cs) count--;
end

assert property (@(posedge clk or posedge rst) (count==0) |-> (empty));
assert property (@(posedge clk or posedge rst) (count==`RAM_DEPTH-1) |-> (full));

//scoreboard mailbox
mailbox fifo_sb = new();

//writing in the scoreboard when writing to fifo
always@ (posedge clk) begin
	if(wr_cs&&wr_en) begin
		fifo_sb.put(data_in);
	end
end

bit [`DATA_WIDTH-1:0] cdata=0;
always@ (posedge clk) begin
	if(rd_cs&&rd_en) begin
		fifo_sb.get(cdata);
	end
end

//read from fifo
assert property(@(posedge clk) (rd_cs&&rd_en) |-> (data_out==cdata));

//reset signal when goes high should eventually goes low
assert property (@(posedge rst) $rose(rst) [*1:$] |-> $fell(rst));

//when reset activated the buffer should be emptied
assert property (@(posedge clk or posedge rst) (rst) |-> (^data_out==1'b0 && empty));

//full and empty are mutually exclusive
assert property (@(posedge clk or posedge rst) not( empty && full ));

//invalid data
assert property(@(posedge clk) (rd_cs&&rd_en) |-> (^data_out!==1'bx));

//can't read when the fifo is empty
assert property(@(posedge clk) not (rd_cs&&rd_en&&empty));

//can't write when the fifo is full
assert property(@(posedge clk) not (wr_cs&&wr_en&&full));

endmodule