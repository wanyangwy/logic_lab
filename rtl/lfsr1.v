`timescale 1ns/1ps

module lfsr1 (clk, resetn, seed, lfsr_out);

        input clk, resetn;
        input [11:0] seed;
        output [11:0] lfsr_out;

        reg [11:0] lfsr_out;

	wire [11:0] lfsr_next;

        always @(posedge clk) begin
            if (~resetn) begin
                lfsr_out <= #0.1 seed;
            end
            else begin
                lfsr_out <= #0.1 lfsr_next;
            end
        end

	assign lfsr_next = {lfsr_out[10:0], lfsr_out[11]^lfsr_out[8]^lfsr_out[5]^lfsr_out[0]};

endmodule

