`timescale 1ns/1ps
`define SD #0.010
`define HALF_CLOCK_PERIOD #0.90
`define QSIM_OUT_FN "./qsim.out"
`define MATLAB_OUT_FN "../matlab/adder.results"

module testbench();

	reg clk;
	reg resetn;
	reg [11:0] seed1, seed2;
	reg cin;
	wire cout;

	integer adder_out_matlab;
	integer adder_out_qsim;
	
	//reg [11:0] add1, add2;
	wire [11:0] lfsrout1, lfsrout2;
	wire [11:0] adder_out;

	integer i;
	integer ret_write;
	integer ret_read;
	integer qsim_out_file;
	integer matlab_out_file;

	integer error_count = 0;
	
	lfsr1 lfsr_0 ( .clk(clk), .resetn(resetn), .seed(seed1), .lfsr_out(lfsrout1) );
	lfsr1 lfsr_1 ( .clk(clk), .resetn(resetn), .seed(seed2), .lfsr_out(lfsrout2) );
	adder adder_0 (.a(lfsrout1), .b(lfsrout2), .c_in(cin), .c_out(cout), .sum(adder_out) );


	always begin
		`HALF_CLOCK_PERIOD;
		clk = ~clk;
	end

	initial begin
		// File IO
		qsim_out_file = $fopen(`QSIM_OUT_FN,"w");
		if (!qsim_out_file) begin
			$display("Couldn't create the output file.");
			$finish;
		end

		matlab_out_file = $fopen(`MATLAB_OUT_FN,"r");
		if (!matlab_out_file) begin
			$display("Couldn't open the Matlab file.");
			$finish;
		end

		// register setup
		clk = 0;
		resetn = 0;
		seed1 = 12'b000000000001;
		seed2 = 12'b000000001001;
		cin = 0;

		@(posedge clk);

		@(negedge clk);   // release resetn
		resetn = 1;      

		@(posedge clk);   // start the first cycle

		for (i=0 ; i<100; i=i+1) begin 
			// compare w/ the results from Matlab sim
			ret_read = $fscanf(matlab_out_file, "%d", adder_out_matlab);
			adder_out_qsim = adder_out;

			$fwrite(qsim_out_file, "%0d\n", adder_out_qsim);
			if (adder_out_qsim != adder_out_matlab) begin
				error_count = error_count + 1;
			end
			@(posedge clk);  // next cycle
			

		end

		// Any mismatch b/w rtl and matlab sims?
		if (error_count > 0) begin
			$display("The results DO NOT match with those from Matlab :( ");
		end
		else begin
			$display("The results DO match with those from Matlab :) ");
		end
 
		// finishing this testbench
		$fclose(qsim_out_file);
		$fclose(matlab_out_file);
		$finish;
	end 

endmodule // testbench

