module binding_module;
bind fifo_tb fifo_asserts U_assert (
.clk (clk),
.rst (rst),
.wr_cs (wr_cs),
.rd_cs (rd_cs),
.rd_en (rd_en),
.wr_en (wr_en),
.data_in (data_in),
.full (full),
.empty (empty),
.data_out (data_out)
);
endmodule