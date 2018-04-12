module binding_module;
bind memory_tb mem_asserts U_assert (
.data_in (data_in),
.read_write (read_write),
.data_out (data_out),
.address (address),
.chip_en (chip_en)
);
endmodule