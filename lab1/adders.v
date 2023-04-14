`ifndef ADDERS
`define ADDERS
`include "gates.v"

// half adder, gate level modeling
module HA(output C, S, input A, B);
	XOR g0(S, A, B);
	AND g1(C, A, B);
endmodule

// full adder, gate level modeling
module FA(output CO, S, input A, B, CI);
	wire c0, s0, c1, s1;
	HA ha0(c0, s0, A, B);
	HA ha1(c1, s1, s0, CI);
	assign S = s1;
	OR or0(CO, c0, c1);
endmodule

// adder without delay, register-transfer level modeling
module adder_rtl(
	output C3,       // carry output
	output[2:0] S,   // sum
	input[2:0] A, B, // operands
	input C0         // carry input
	);
	assign {C3, S} = A+B+C0;
endmodule

//  ripple-carry adder, gate level modeling
//  Do not modify the input/output of module
module rca_gl(
	output C3,       // carry output
	output[2:0] S,   // sum
	input[2:0] A, B, // operands
	input C0         // carry input
	);

	// TODO:: Implement gate-level RCA
	wire [1:0] C;
	wire [2:0] S_int;

	FA fa0(C[0], S_int[0], A[0], B[0], C0);
	FA fa1(C[1], S_int[1], A[1], B[1], C[0]);
	FA fa2(C3, S_int[2], A[2], B[2], C[1]);

	assign S = S_int;
endmodule

// carry-lookahead adder, gate level modeling
// Do not modify the input/output of module
module cla_gl(
	output C3,       // carry output
	output[2:0] S,   // sum
	input[2:0] A, B, // operands
	input C0         // carry input
	);

	// TODO:: Implement gate-level CLA
	wire [2:0] p;
	wire [2:0] g;
	wire [2:0] c;
	wire [2:0] s;

	assign p = A ^ B;
	assign g = A & B;
	assign c[0] = g[0] | (p[0] & C0);
	assign c[1] = g[1] | (p[1] & c[0]);
	assign c[2] = g[2] | (p[2] & c[1]);

	assign s = A ^ B ^ c;
	assign S = s;
	assign C3 = c[2];
endmodule

`endif
