module counter(
	input clk,
	input rst_n,
	input num_i,
	output reg of,
	output reg [7:0] cnt
);
parameter A=2'b00, B=2'b01, C=2'b11, D=2'b10; 
reg [1:0] next_state;
reg [1:0] current_state;
reg detected;
reg [3:0] tram;
reg [3:0] chuc;
reg [3:0] donvi;
wire [6:0] otram;
wire [6:0] ochuc;
wire [6:0] odonvi;

always @(posedge clk or negedge rst_n) begin:RESET
	if(!rst_n) begin 
		of <= 1'b0;
		cnt <= 8'b00000000;
		next_state <= A;
	end
	else begin
	  	if(cnt == 8'b11111111) 
			of <= 1'b1;
		else if(detected == 1)
			cnt <= cnt +1;
		current_state <= next_state;
		tram <= cnt / 100;
		chuc <= (cnt % 100) / 10;
		donvi <= (cnt % 100) % 10;
	end
end
always @(num_i or current_state) begin:FSM
case(current_state)
	A: begin 
		detected = 1'b0;
		if(num_i == 0)
		next_state = B;
		else next_state = A;
	end
	B: begin
		detected = 1'b0;
		if(num_i == 0)
		next_state = B;
		else next_state = C;
	end
	C: begin
		detected = 1'b0;
		if(num_i == 0)
		next_state = D;
		else next_state = A;
	end
	D: if(num_i == 0) begin
			next_state = B;
			detected =0;
		end
		else begin 
			next_state = A;
			detected = 1'b1; 
		end
	default: next_state = A;
endcase
end
	led7seg ledtram(.inled(tram), .outled(otram));
	led7seg ledchuc(.inled(chuc), .outled(ochuc));
	led7seg leddonvi(.inled(donvi), .outled(odonvi));
endmodule

