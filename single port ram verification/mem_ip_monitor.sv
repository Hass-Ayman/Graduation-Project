`ifndef MEM_IP_MONITOR_SV
`define MEM_IP_MONITOR_SV
class mem_ip_monitor;
  mem_base_object mem_object;
  mem_scoreboard  sb;
  virtual mem_ports       ports;

function new (mem_scoreboard sb,virtual mem_ports ports);
  begin  
    this.sb    = sb;
    this.ports = ports;
  end
endfunction


task input_monitor();
  begin
    while (1) begin
      @ (posedge ports.clock);
      if ((ports.chip_en == 1) && (ports.read_write == 1)) begin
         mem_object = new();
         $display("input_monitor : Memory wr access-> Address : %x Data : %x",ports.address,ports.data_in);
	 mem_object.addr = ports.address;
	 mem_object.data = ports.data_in;
         sb.post_input(mem_object);
      end
    end
  end
endtask

endclass

`endif