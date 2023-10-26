`timescale 1ns/1ps

module adder (  input [11:0] a,  
                  input [11:0] b,  
                  input c_in,  
                  output reg c_out,  
                  output reg [11:0] sum);  
  
	always @ (a or b or c_in) begin  
		{c_out, sum} = a + b + c_in;  
	end  
endmodule


