module binding_module;
bind mem_tb mem_asserts U_assert (
.data_ip (data),
.we_ip (we),
.clk_ip (clk),
.address_ip (address),
.oe_ip (oe),
.cs_ip (cs)
);
endmodule