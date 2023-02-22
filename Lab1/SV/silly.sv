module fulladder (input  logic a, b, c, output logic out, cout);
  assign out = a ^ b ^ c;
  assign cout = a & b | a & c | b & c;
   
endmodule


module rca (input logic [3:0] a, b, input logic c, output logic [3:0] out, cout);

fulladder fa1 (a[0], b[0], c, out[0], cout[0]);
fulladder fa2 (a[1], b[1], cout[0], out[1], cout[1]);
fulladder fa3 (a[2], b[2], cout[1], out[2], cout[2]);
fulladder fa4 (a[3], b[3], cout[2], out[3], cout[3]);

endmodule