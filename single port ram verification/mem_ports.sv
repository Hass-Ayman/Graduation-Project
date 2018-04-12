`ifndef MEM_PORTS_SV
`define MEM_PORTS_SV

interface mem_ports(
 input  wire  clock,
 output logic [7:0] address,
 output logic chip_en,
 output logic read_write,
 output logic [7:0] data_in,
 input logic [7:0] data_out
);
endinterface

`endif