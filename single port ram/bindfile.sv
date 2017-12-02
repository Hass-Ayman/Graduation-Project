module binding_module;
bind mem  mem_asserts  U_assert (
.data_ip (data),
.we_ip (we),
.clk_ip (clk),
.address_ip   (address)
);
endmodule

