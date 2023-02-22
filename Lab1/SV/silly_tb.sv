`timescale 1ns / 1ps
module tb ();

   logic [3:0] a; // 4 bit input
   logic [3:0] b; // 4 bti input
   logic [0:0] c;
   logic [3:0] out;
   logic [3:0] cout;  
   logic [3:0] Sum;
   logic [3:0] Sum_corr;
   logic [3:0] Sum_correct;

   logic 	clk;
   
  // instantiate device under test
   rca dut (a, b, c, out, cout);
 ////////////////////////////////////////////////////////////////////
   // 20 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end

	integer handle3;
	integer desc3;
	integer i;
	
	
	initial
		begin
			handle3 = $fopen("rca.out");
			desc3 = handle3;
			#1250 $finish;
	end

	initial
		begin
		for (i=0; i < 128; i=i+1)
			begin

				@(posedge clk)
					begin
							#20 a = $random;
							#0 b = $random;
							#0 c = $random;
							#0 Sum_corr = a + b + c;
							#0 Sum = out;
							if (Sum == Sum_corr)
								Sum_correct = 1;
							else
								Sum_correct = 0;
					end
					@(negedge clk)
					begin
					$fdisplay(desc3, "%h %h %h || %h | %h | %b", a, b, c, Sum, Sum_correct, (Sum == Sum_corr));
					end
			end // @(negedge clk)
		end



/*

  
   
  // instantiate device under test
   rca dut (a, b, c, sum, cout);

   initial 
     begin	
		clk = 1'b1;
		forever #10 clk = ~clk;
     end

   initial
     begin
    
	#0   a = 4'b0000;	
	#0   b = 4'b0000;
	#0   c = 1'b0;

	#20  a = 4'b0000;
	#0   b = 4'b0000;
	#0   c = 1'b1;

	#20  a = 4'b0000;
	#0   b = 4'b0001;
	#0   c = 1'b0;

	#20  a = 4'b0000;
	#0   b = 4'b0001;
	#0   c = 1'b1;

	#0   a = 4'b0001;	
	#0   b = 4'b0000;
	#0   c = 1'b0;

	#20  a = 4'b1;
	#0   b = 4'b0;
	#0   c = 1'b1;

	#20  a = 1'b1;
	#0   b = 1'b1;
	#0   c = 1'b0;

	#20  a = 1'b1;
	#0   b = 1'b1;
	#0   c = 1'b1;

	#20  a = $random;
	#0   b = $random;
	#0   c = $random;

	#20  a = $random;
	#0   b = $random;
	#0   c = $random;

	#20  a = $random;
	#0   b = $random;
	#0   c = $random;	
     end
*/
   
endmodule
