`timescale 1ns/1ps
`define data_width (8)
`define ram_depth (1024*1024*1024)
`define address_width (30)

module mem_tb();

    reg clk;
    reg[`address_width-1:0] address;
    wire[`data_width-1:0] data;
    reg we;
    reg oe;
    reg cs;
    reg[`data_width-1:0] data_out;

    binding_module bindass();

    ram_sp_sr_sw inst(.clk(clk), .address(address), .data(data), .we(we), .oe(oe), .cs(cs));

    initial begin
        clk <= 0;
        address <= 0;
        we <= 0;
        oe <= 0;
        cs <= 0;
        #5;
    end

    always
        #5  clk =  ! clk;

    assign data = (cs && we && !oe) ? data_out : 8'bz;

    default clocking mem_clk @(posedge clk);
        output oe, cs, address, we;
        input data;
    endclocking

    initial begin
			address<=0;##1;
        we <= 1;
        cs <= 1;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=214748364;##1;
        we <= 1;
        cs <= 1;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='1;
        end
        #10;
			address<=429496729;##1;
        we <= 1;
        cs <= 1;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=644245094;##1;
        we <= 1;
        cs <= 1;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='0;
        end
        #10;
			address<=858993459;##1;
        we <= 1;
        cs <= 1;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=0;##1;
        we <= 1;
        cs <= 1;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=214748364;##1;
        we <= 1;
        cs <= 1;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='1;
        end
        #10;
			address<=429496729;##1;
        we <= 1;
        cs <= 1;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=644245094;##1;
        we <= 1;
        cs <= 1;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='0;
        end
        #10;
			address<=858993459;##1;
        we <= 1;
        cs <= 1;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=0;##1;
        we <= 1;
        cs <= 0;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=214748364;##1;
        we <= 1;
        cs <= 0;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='1;
        end
        #10;
			address<=429496729;##1;
        we <= 1;
        cs <= 0;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=644245094;##1;
        we <= 1;
        cs <= 0;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='0;
        end
        #10;
			address<=858993459;##1;
        we <= 1;
        cs <= 0;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=0;##1;
        we <= 1;
        cs <= 0;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=214748364;##1;
        we <= 1;
        cs <= 0;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='1;
        end
        #10;
			address<=429496729;##1;
        we <= 1;
        cs <= 0;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=644245094;##1;
        we <= 1;
        cs <= 0;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='0;
        end
        #10;
			address<=858993459;##1;
        we <= 1;
        cs <= 0;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out=$urandom(j)%255;
        end
        #10;
			address<=107374182;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=1;
            oe <=0;
            address<=address+1;
            data_out= '0;
            ##2 we <= 0;
            cs <=1;
            oe <=1;
            ##2;
        end
        #10;
			address<=322122547;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=1;
            oe <=0;
            address<=address+1;
            data_out= '1;
            ##2 we <= 0;
            cs <=1;
            oe <=1;
            ##2;
        end
        #10;
			address<=536870912;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=1;
            oe <=0;
            address<=address+1;
            data_out= $urandom(j)%255;
            ##2 we <= 0;
            cs <=1;
            oe <=1;
            ##2;
        end
        #10;
			address<=107374182;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=0;
            oe <=0;
            address<=address+1;
            data_out= '0;
            ##2 we <= 0;
            cs <=0;
            oe <=1;
            ##2;
        end
        #10;
			address<=322122547;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=0;
            oe <=0;
            address<=address+1;
            data_out= '1;
            ##2 we <= 0;
            cs <=0;
            oe <=1;
            ##2;
        end
        #10;
			address<=536870912;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=0;
            oe <=0;
            address<=address+1;
            data_out= $urandom(j)%255;
            ##2 we <= 0;
            cs <=0;
            oe <=1;
            ##2;
        end
        #10;
			address<=0;##1;
        we <= 0;
        cs <= 1;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=214748364;##1;
        we <= 0;
        cs <= 1;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=429496729;##1;
        we <= 0;
        cs <= 1;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=644245094;##1;
        we <= 0;
        cs <= 1;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='0;
        end
        #10;
			address<=858993459;##1;
        we <= 0;
        cs <= 1;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=0;##1;
        we <= 0;
        cs <= 1;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=214748364;##1;
        we <= 0;
        cs <= 1;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=429496729;##1;
        we <= 0;
        cs <= 1;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=644245094;##1;
        we <= 0;
        cs <= 1;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='0;
        end
        #10;
			address<=858993459;##1;
        we <= 0;
        cs <= 1;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=0;##1;
        we <= 0;
        cs <= 0;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=214748364;##1;
        we <= 0;
        cs <= 0;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=429496729;##1;
        we <= 0;
        cs <= 0;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=644245094;##1;
        we <= 0;
        cs <= 0;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='0;
        end
        #10;
			address<=858993459;##1;
        we <= 0;
        cs <= 0;
        oe <= 1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=0;##1;
        we <= 0;
        cs <= 0;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=214748364;##1;
        we <= 0;
        cs <= 0;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=429496729;##1;
        we <= 0;
        cs <= 0;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=644245094;##1;
        we <= 0;
        cs <= 0;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
            data_out='0;
        end
        #10;
			address<=858993459;##1;
        we <= 0;
        cs <= 0;
        oe <= 0;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            address<=address+1;
        end
        #10;
			address<=107374182;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=1;
            oe <=0;
            address<=address+1;
            data_out= '0;
            ##2 we <= 0;
            cs <=1;
            oe <=1;
            ##2;
        end
        #10;
			address<=322122547;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=1;
            oe <=0;
            address<=address+1;
            data_out= '1;
            ##2 we <= 0;
            cs <=1;
            oe <=1;
            ##2;
        end
        #10;
			address<=536870912;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=1;
            oe <=0;
            address<=address+1;
            data_out= $urandom(j)%255;
            ##2 we <= 0;
            cs <=1;
            oe <=1;
            ##2;
        end
        #10;
			address<=107374182;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=0;
            oe <=0;
            address<=address+1;
            data_out= '0;
            ##2 we <= 0;
            cs <=0;
            oe <=1;
            ##2;
        end
        #10;
			address<=322122547;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=0;
            oe <=0;
            address<=address+1;
            data_out= '1;
            ##2 we <= 0;
            cs <=0;
            oe <=1;
            ##2;
        end
        #10;
			address<=536870912;##1;
        for(int j=0;j<31;j++) begin
            @(negedge clk)
            we <= 1;
            cs <=0;
            oe <=0;
            address<=address+1;
            data_out= $urandom(j)%255;
            ##2 we <= 0;
            cs <=0;
            oe <=1;
            ##2;
        end
        #10;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h9532901;
        assign data_out= 8'h60 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h3b4eb47a;
        assign data_out= 8'hcb ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h1a30c72b;
        assign data_out= 8'hb7 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h38951569;
        assign data_out= 8'hca ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h52053dd;
        assign data_out= 8'hf5 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h396e45ca;
        assign data_out= 8'ha8 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'hc1d93b5;
        assign data_out= 8'hbf ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h3ea95dd5;
        assign data_out= 8'hcb ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h10096c1c;
        assign data_out= 8'h56 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h27861cd1;
        assign data_out= 8'h66 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h115e7646;
        assign data_out= 8'h54 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h2bf365a7;
        assign data_out= 8'h6f ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h3fc99c4a;
        assign data_out= 8'h26 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h22dc0939;
        assign data_out= 8'hb0 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h2a6c9cfd;
        assign data_out= 8'h22 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h29f85cfd;
        assign data_out= 8'ha6 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h1444db12;
        assign data_out= 8'h78 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h314d41f5;
        assign data_out= 8'h9d ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h216cf3e3;
        assign data_out= 8'h56 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h29879cec;
        assign data_out= 8'ha0 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h543eac1;
        assign data_out= 8'h48 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h2b43b3bf;
        assign data_out= 8'he7 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h3f798702;
        assign data_out= 8'hca ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h231ae45d;
        assign data_out= 8'hcc ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h3b90fa56;
        assign data_out= 8'h65 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h2f89d8d3;
        assign data_out= 8'hbb ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h256fae57;
        assign data_out= 8'h24 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h3abb0845;
        assign data_out= 8'h86 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h100ade80;
        assign data_out= 8'h24 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h2dc471d9;
        assign data_out= 8'h79 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h2ec80362;
        assign data_out= 8'h76 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h22407395;
        assign data_out= 8'hfa ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h67083cb;
        assign data_out= 8'hfc ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h6eaa5ca;
        assign data_out= 8'h88 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h35c1da88;
        assign data_out= 8'hd1 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h17febf9a;
        assign data_out= 8'h1a ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h2c438af2;
        assign data_out= 8'h53 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h1d28c5c8;
        assign data_out= 8'h1f ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h17aa2307;
        assign data_out= 8'hee ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h2e0012e5;
        assign data_out= 8'hd7 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h212e4251;
        assign data_out= 8'h78 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h31ebc49b;
        assign data_out= 8'h59 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h2c69afe8;
        assign data_out= 8'hf6 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'hff5facd;
        assign data_out= 8'hff ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h2d9bc2c6;
        assign data_out= 8'hc ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h6669f8b;
        assign data_out= 8'he8 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h3b31e887;
        assign data_out= 8'ha8 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h22284beb;
        assign data_out= 8'hed ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h3b4512db;
        assign data_out= 8'h44 ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        we <= 1;
        cs <= 1;
        oe <= 0;
        @(negedge clk)
        address <= 30'h252c99ac;
        assign data_out= 8'hae ;
        ##3 we <= 0;
        cs <= 1;
        oe <= 1;
        ##2;
        $finish;
   end;

endmodule