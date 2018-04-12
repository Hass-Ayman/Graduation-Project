`ifndef MEM_OP_MONITOR_SV
`define MEM_OP_MONITOR_SV

class mem_op_monitor;
  mem_base_object mem_object;
  mem_scoreboard sb;
  virtual mem_ports       ports;

function new (mem_scoreboard sb,virtual mem_ports ports);
  begin
    this.sb    = sb;
    this.ports = ports;
  end
endfunction
  

task output_monitor();
  begin
    while (1) begin
      @ (negedge ports.clock);
      if ((ports.chip_en == 1) && (ports.read_write == 0)) begin
        mem_object = new();
        $display("Output_monitor : Memory rd access-> Address : %x Data : %x",ports.address,ports.data_out);
        mem_object.addr = ports.address;
        mem_object.data = ports.data_out;
        sb.post_output(mem_object);
      end
    end
  end
endtask


endclass

`endif