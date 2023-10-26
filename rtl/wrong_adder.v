module fulladd(cin, x, y, cout, s)
	input cin, x, y;
	output s, cout;
	assign s = x^y^cin;
	assign cout = (x&y)|(x&cin)|(y&cin);
endmodule


module adder (resetn, add1, add2, adder_out);

        input clk, resetn;
        input [11:0] add1, add2;
        output [11:0] adder_out;

        reg [11:0] adder_out;

	wire carry;

        always @(add1|add2|resetn) begin
            if (~resetn) begin
                adder_out <= 12'b0;
            end
            else begin
		{fulladd(0, add1[0], add2[0], carry, adder_out[0])
		for(i=0;i<12;i=i+1) begin:
			fulladd(carry, add1[i], add2[i], carry, adder_out[i]);
		end
            end
        end

endmodule
