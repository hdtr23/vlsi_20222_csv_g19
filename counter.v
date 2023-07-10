module counter(
	input clk,
	input rst_n,
	input num_i,
	output reg of,
	output reg [7:0] cnt
);
parameter A=3'b000, B=3'b001, C=3'b011, D=3'b010, E=3'b110; 
reg [2:0] next_state;
reg [2:0] current_state;
initial begin
	cnt = 0;
	of = 0;
end
always @(posedge clk) begin:RESET
	if(!rst_n) begin 
		of <= 1'b0;
		cnt <= 8'b00000000;
		next_state = A;
	end
	else begin
	  	if(cnt == 8'b11111111) 
			of <= 1'b1;
		if(!of && current_state == E)
			cnt <= cnt + 1'b1;
	end
end
always @(posedge clk) begin:FSM
current_state = next_state;
case(current_state)
	A: if(num_i == 0)
		next_state = B;
		else next_state = A;
	B: if(num_i == 0)
		next_state = B;
		else next_state = C;
	C: if(num_i == 0)
		next_state = D;
		else next_state = A;
	D: if(num_i == 0)
		next_state = B;
		else next_state = E;
	E: if(num_i == 0)
		next_state = D;
		else next_state = A;
	default : begin 
		current_state = A;
		next_state = A;
	end
endcase

end

// always @(posedge clk) begin: COUNTER
// 	if(cnt == 8'b11111111) 
// 		of <= 1'b1;
// 	if(!of && current_state == E)
// 		cnt <= cnt + 1'b1;
// end
endmodule

