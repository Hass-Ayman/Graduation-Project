`define data_width (8)
`define ram_depth (1024*1024*1024)
`define address_width (30)
module ram_sp_sr_sw (
clk         , // Clock Input
address     , // Address Input
data        , // Data bi-directional
cs          , // Chip Select
we          , // Write Enable/Read Enable
oe            // Output Enable
); 

//--------------Input Ports----------------------- 
input                  clk         ;
input [`address_width-1:0] address ;
input                  cs          ;
input                  we          ;
input                  oe          ; 

//--------------Inout Ports----------------------- 
inout [`data_width-1:0]  data       ;

//--------------Internal variables---------------- 
reg [`data_width-1:0] data_out ;
reg [`data_width-1:0] mem [0:`ram_depth-1];
reg                  oe_r;

//--------------Code Starts Here------------------ 

// Tri-State Buffer control 
// output : When we = 0, oe = 1, cs = 1
assign data = (cs && oe &&  ! we) ? data_out : 8'bz; 

// Memory Write Block 
// Write Operation : When we = 1, cs = 1
always @ (posedge clk)
begin : MEM_WRITE
   if ( cs && we ) begin
       mem[address] = data;
   end
end

// Memory Read Block 
// Read Operation : When we = 0, oe = 1, cs = 1
always @ (posedge clk)
begin : MEM_READ
  if (cs &&  ! we && oe) begin
    data_out = mem[address];
    oe_r = 1;
  end else begin
    oe_r = 0;
  end
end

endmodule // End of Module ram_sp_sr_sw
