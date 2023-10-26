/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP5-1
// Date      : Sat Oct 21 20:33:42 2023
/////////////////////////////////////////////////////////////


module fulladder ( a, b, c_in, c_out, sum );
  input [11:0] a;
  input [11:0] b;
  output [11:0] sum;
  input c_in;
  output c_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  CMPR32X2TS U1 ( .A(a[11]), .B(b[11]), .C(n1), .CO(c_out), .S(sum[11]) );
  CMPR32X2TS U2 ( .A(a[10]), .B(b[10]), .C(n2), .CO(n1), .S(sum[10]) );
  CMPR32X2TS U3 ( .A(a[9]), .B(b[9]), .C(n3), .CO(n2), .S(sum[9]) );
  CMPR32X2TS U4 ( .A(a[8]), .B(b[8]), .C(n4), .CO(n3), .S(sum[8]) );
  CMPR32X2TS U5 ( .A(a[7]), .B(b[7]), .C(n5), .CO(n4), .S(sum[7]) );
  CMPR32X2TS U6 ( .A(a[6]), .B(b[6]), .C(n6), .CO(n5), .S(sum[6]) );
  CMPR32X2TS U7 ( .A(a[5]), .B(b[5]), .C(n7), .CO(n6), .S(sum[5]) );
  CMPR32X2TS U8 ( .A(a[4]), .B(b[4]), .C(n8), .CO(n7), .S(sum[4]) );
  CMPR32X2TS U9 ( .A(a[3]), .B(b[3]), .C(n9), .CO(n8), .S(sum[3]) );
  CMPR32X2TS U10 ( .A(a[2]), .B(b[2]), .C(n10), .CO(n9), .S(sum[2]) );
  CMPR32X2TS U11 ( .A(a[1]), .B(b[1]), .C(n11), .CO(n10), .S(sum[1]) );
  CMPR32X2TS U12 ( .A(c_in), .B(a[0]), .C(b[0]), .CO(n11), .S(sum[0]) );
endmodule

