`include "memory.sv"

module memory_tb();

wire [7:0] address, data_in;
wire [7:0] data_out;
wire  read_write, chip_en;
reg clk;

// Connect the interface
mem_ports ports(
 .clock       (clk),
 .address     (address),
 .chip_en     (chip_en),
 .read_write  (read_write),
 .data_in     (data_in),
 .data_out    (data_out)
);

//binding_module bindass();

// Connect the program
memory_top top (ports);

initial begin
  clk = 0;
end	

always #1 clk = ~clk;

memory U_memory(
.address             (address),
.data_in             (data_in),
.data_out            (data_out),
.read_write          (read_write),
.chip_en             (chip_en)
);
endmodule