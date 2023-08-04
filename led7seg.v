module led7seg (
    input [3:0] i_led,
    output reg [6:0] o_led
);
always @(i_led) begin
    case (i_led)
        0: o_led <= 7'b0000001; 
        1: o_led <= 7'b1001111; 
        2: o_led <= 7'b0010010; 
        3: o_led <= 7'b0000110; 
        4: o_led <= 7'b1001100; 
        5: o_led <= 7'b0100100; 
        6: o_led <= 7'b0100000; 
        7: o_led <= 7'b0001111; 
        8: o_led <= 7'b0000000; 
        9: o_led <= 7'b0000100; 
        default: o_led <= 7'b0000001;
    endcase
end
endmodule