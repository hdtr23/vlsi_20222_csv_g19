module top_module (
    input clk,
    input rst_n,
    input num_i,
    output wire [6:0] otram,
    output wire [6:0] ochuc,
    output wire [6:0] odonvi,
    output wire of
);

wire [3:0] tram;
wire [3:0] chuc;
wire [3:0] donvi;
wire [7:0] cnt;

counter count(
.clk(clk),
.rst_n(rst_n),
.num_i(num_i),
.of(of),
.cnt(cnt)
);

assign tram = cnt / 100;
assign chuc = (cnt % 100) / 10;
assign donvi = (cnt % 100) % 10;

led7seg ledtram(.inled(tram), .outled(otram));
led7seg ledchuc(.inled(chuc), .outled(ochuc));
led7seg leddonvi(.inled(donvi), .outled(odonvi));
endmodule
