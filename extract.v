module extract (
    input [7:0] c_cnt,
    output wire [3:0] l_tram,
    output wire [3:0] l_chuc,
    output wire [3:0] l_dv
);

assign l_tram = c_cnt / 100;
assign l_chuc = (c_cnt % 100) / 10;
assign l_dv = (c_cnt % 100) % 10;


endmodule