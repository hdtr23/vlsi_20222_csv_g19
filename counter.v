module counter(
	input i_clk,
	input i_rst_n,
	input i_num_i,
	output reg o_of,
	output reg [7:0] c_cnt

);
parameter A=2'b00, B=2'b01, C=2'b11, D=2'b10; 

reg [1:0] next_state;
reg [1:0] current_state;
reg detected;
// reg [3:0] tram;
// reg [3:0] chuc;
// reg [3:0] donvi;

// wire [6:0] otram;
// wire [6:0] ochuc;
// wire [6:0] odonvi;

always @(posedge i_clk or negedge i_rst_n) begin:RESET
	if(!i_rst_n) begin 
		o_of <= 1'b0;
		c_cnt <= 8'b00000000;
		next_state <= A;
	end
	else begin
	  	if(c_cnt == 8'b11111111) 
			o_of <= 1'b1;
		else if(detected == 1)
			c_cnt <= c_cnt +1;
		current_state <= next_state;
		// tram <= c_cnt / 100;
		// chuc <= (c_cnt % 100) / 10;
		// donvi <= (c_cnt % 100) % 10;
	end
end
always @(i_num_i or current_state) begin:FSM
case(current_state)
	A: begin 
		detected = 1'b0;
		if(i_num_i == 0)
		next_state = B;
		else next_state = A;
	end
	B: begin
		detected = 1'b0;
		if(i_num_i == 0)
		next_state = B;
		else next_state = C;
	end
	C: begin
		detected = 1'b0;
		if(i_num_i == 0)
		next_state = D;
		else next_state = A;
	end
	D: if(i_num_i == 0) begin
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
	// led7seg ledtram(.inled(tram), .outled(otram));
	// led7seg ledchuc(.inled(chuc), .outled(ochuc));
	// led7seg leddonvi(.inled(donvi), .outled(odonvi));
endmodule

