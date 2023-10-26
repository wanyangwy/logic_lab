/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP5-1
// Date      : Sat Oct 21 20:36:22 2023
/////////////////////////////////////////////////////////////


module fulladder ( a, b, c_in, c_out, sum );
  input [11:0] a;
  input [11:0] b;
  output [11:0] sum;
  input c_in;
  output c_out;
  wire   n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43;

  CMPR32X2TS U1 ( .A(a[10]), .B(b[10]), .C(n34), .CO(n33), .S(n44) );
  CMPR32X2TS U2 ( .A(a[9]), .B(b[9]), .C(n35), .CO(n34), .S(n45) );
  CMPR32X2TS U3 ( .A(a[8]), .B(b[8]), .C(n36), .CO(n35), .S(n46) );
  CMPR32X2TS U4 ( .A(a[7]), .B(b[7]), .C(n37), .CO(n36), .S(n47) );
  CMPR32X2TS U5 ( .A(a[6]), .B(b[6]), .C(n38), .CO(n37), .S(n48) );
  CMPR32X2TS U6 ( .A(a[5]), .B(b[5]), .C(n39), .CO(n38), .S(n49) );
  CMPR32X2TS U7 ( .A(a[4]), .B(b[4]), .C(n40), .CO(n39), .S(n50) );
  CMPR32X2TS U8 ( .A(a[3]), .B(b[3]), .C(n41), .CO(n40), .S(n51) );
  CMPR32X2TS U9 ( .A(c_in), .B(a[0]), .C(b[0]), .CO(n43), .S(n54) );
  NOR2XLTS U10 ( .A(n23), .B(n24), .Y(n32) );
  OR2X1TS U11 ( .A(n3), .B(n5), .Y(n1) );
  OR2X1TS U12 ( .A(n32), .B(n4), .Y(n2) );
  OR2X1TS U13 ( .A(n26), .B(n27), .Y(n3) );
  OR2X1TS U14 ( .A(n30), .B(n31), .Y(n4) );
  OR2X1TS U15 ( .A(n28), .B(n29), .Y(n5) );
  OR2X1TS U16 ( .A(n23), .B(n24), .Y(n6) );
  OR2X1TS U17 ( .A(a[11]), .B(n33), .Y(n7) );
  OR2X1TS U18 ( .A(b[11]), .B(n33), .Y(n8) );
  OR2X1TS U19 ( .A(b[11]), .B(a[11]), .Y(n9) );
  BUFX20TS U20 ( .A(n44), .Y(sum[10]) );
  BUFX20TS U21 ( .A(n45), .Y(sum[9]) );
  BUFX20TS U22 ( .A(n46), .Y(sum[8]) );
  BUFX20TS U23 ( .A(n47), .Y(sum[7]) );
  BUFX20TS U24 ( .A(n48), .Y(sum[6]) );
  BUFX20TS U25 ( .A(n54), .Y(sum[0]) );
  BUFX20TS U26 ( .A(n49), .Y(sum[5]) );
  BUFX20TS U27 ( .A(n50), .Y(sum[4]) );
  BUFX20TS U28 ( .A(n51), .Y(sum[3]) );
  BUFX20TS U29 ( .A(n1), .Y(sum[11]) );
  BUFX20TS U30 ( .A(n2), .Y(c_out) );
  BUFX20TS U31 ( .A(n52), .Y(sum[2]) );
  BUFX20TS U32 ( .A(n53), .Y(sum[1]) );
  CLKINVX1TS U33 ( .A(b[11]), .Y(n23) );
  INVX1TS U34 ( .A(a[11]), .Y(n24) );
  INVX2TS U35 ( .A(n33), .Y(n25) );
  NOR2XLTS U36 ( .A(n23), .B(n7), .Y(n26) );
  NOR2XLTS U37 ( .A(n24), .B(n8), .Y(n27) );
  NOR2XLTS U38 ( .A(n25), .B(n9), .Y(n28) );
  NOR2XLTS U39 ( .A(n25), .B(n6), .Y(n29) );
  NOR2XLTS U40 ( .A(n24), .B(n25), .Y(n30) );
  NOR2XLTS U41 ( .A(n23), .B(n25), .Y(n31) );
  CMPR32X2TS U42 ( .A(a[2]), .B(b[2]), .C(n42), .CO(n41), .S(n52) );
  CMPR32X2TS U43 ( .A(a[1]), .B(b[1]), .C(n43), .CO(n42), .S(n53) );
endmodule

