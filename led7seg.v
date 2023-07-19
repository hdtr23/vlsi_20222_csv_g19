module led7seg (
    input [3:0] inled,
    output reg [6:0] outled
);
always @(inled) begin
    case (inled)
        0: outled <= 7'b0000001;
        1: outled <= 7'b1001111;
        2: outled <= 7'b0010010;
        3: outled <= 7'b0000110;
        4: outled <= 7'b1001100;
        5: outled <= 7'b0100100;
        6: outled <= 7'b0100000;
        7: outled <= 7'b0001111;
        8: outled <= 7'b0000000;
        9: outled <= 7'b0000100;
        default: outled <= 7'b0000001;
    endcase
end
endmodule