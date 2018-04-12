`ifndef MEM_TXGEN_SV
`define MEM_TXGEN_SV
class mem_txgen;
  mem_base_object  mem_object;
  mem_driver  mem_driver;
  
  integer num_cmds;

function new(virtual mem_ports ports);
  begin
    num_cmds = 3;
    mem_driver = new(ports);
  end
endfunction


task gen_cmds();
  begin
    integer i = 0;
    for (i=0; i < num_cmds; i ++ ) begin
      mem_object = new();
      mem_object.addr = $random();
      mem_object.data = $random();
      mem_object.rd_wr = 1;
      mem_driver.drive_mem(mem_object);
      mem_object.rd_wr = 0;
      mem_driver.drive_mem(mem_object);
    end
  end
endtask

endclass
`endif