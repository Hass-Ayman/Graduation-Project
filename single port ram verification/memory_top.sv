
`include "mem_ports.sv"

program memory_top(mem_ports ports);
`include "mem_base_object.sv"
`include "mem_driver.sv"
`include "mem_txgen.sv"
`include "mem_scoreboard.sv"
`include "mem_ip_monitor.sv"
`include "mem_op_monitor.sv"
  mem_txgen txgen;
  mem_scoreboard sb;
  mem_ip_monitor ipm;
  mem_op_monitor opm;

initial begin
  sb    = new();
  ipm   = new (sb, ports);
  opm   = new (sb, ports);
  txgen = new(ports);
  fork
    ipm.input_monitor();
    opm.output_monitor();
  join_none
  txgen.gen_cmds();
  repeat (20) @ (posedge ports.clock);
end

endprogram