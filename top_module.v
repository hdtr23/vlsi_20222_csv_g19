module top_module (
    input i_clk,
    input i_rst_n,
    input i_num_i,
    output wire [6:0] o_tram,
    output wire [6:0] o_chuc,
    output wire [6:0] o_dv,
    output wire o_of
);
wire [3:0] tram;
wire [3:0] chuc;
wire [3:0] dv;

counter count(
.i_clk(i_clk),
.i_rst_n(i_rst_n),
.i_num_i(i_num_i),
.o_of(o_of),
.c_cnt(c_cnt)
);

extract extract_bit(.c_cnt(c_cnt),.l_tram(tram),.l_chuc(chuc),.l_dv(dv));

led7seg ledtram(.i_led(tram), .o_led(o_tram));
led7seg ledchuc(.i_led(chuc), .o_led(o_chuc));
led7seg leddonvi(.i_led(dv), .o_led(o_dv));
endmodule
