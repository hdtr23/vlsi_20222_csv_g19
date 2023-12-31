`timescale 1ns/1ps

module counter_tb();

reg clk_tb;
reg rst_n_tb;
reg num_i_tb;
wire of_tb;
wire [7:0] cnt_tb;

initial begin
    clk_tb = 0;
    forever begin
        clk_tb = !clk_tb;
        #5;
    end
end

initial begin
    rst_n_tb = 0;
    #10;
    rst_n_tb = 1;
    #1000;
    rst_n_tb = 0;
    #10;
    rst_n_tb = 1;
    #11000;
    rst_n_tb = 0;
    #10;
    rst_n_tb = 1;
end

initial begin
    num_i_tb = 0;
    #10;
    num_i_tb = 1;
    #20;
    num_i_tb = 0;
    #20;
    num_i_tb = 1;
    #10;
    forever begin
        num_i_tb = !num_i_tb;
        #10;
    end
end


counter cnt(
.i_clk(clk_tb),
.i_rst_n(rst_n_tb),
.i_num_i(num_i_tb),
.o_of(of_tb),
.c_cnt(cnt_tb)
);

endmodule