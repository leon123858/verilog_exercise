`ifndef ADDERS
`define ADDERS
`include "gates.v"

// half adder, gate level modeling
module HA(output C,
          S,
          input A,
          B);
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
                
                FA fa0(C[0], S[0], A[0], B[0], C0);
                FA fa1(C[1], S[1], A[1], B[1], C[0]);
                FA fa2(C3, S[2], A[2], B[2], C[1]);
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
                    wire P[0:2];
                    wire G[0:2];
                    wire C[1:2];
                    wire tmp[0:5];
                    wire tmp_[0:1];
                    wire tmp2;
                    wire x;
                    // first level FA
                    // p(v1-quick)
                    OR or0(P[0],A[0],B[0]);
                    OR or1(P[1],A[1],B[1]);
                    OR or2(P[2],A[2],B[2]);
                    // p(v2)
                    // XOR xor0(P[0],A[0],B[0]);
                    // XOR xor1(P[1],A[1],B[1]);
                    // XOR xor2(P[2],A[2],B[2]);
                    // g
                    AND and0(G[0],A[0],B[0]);
                    AND and1(G[1],A[1],B[1]);
                    AND and2(G[2],A[2],B[2]);
                    // second level carry look ahead
                    // c(*)
                    AND cin0(tmp[0],P[0],C0);
                    AND cin1(tmp[1],P[1],G[0]);
                    AND cin2(tmp[2],P[2],G[1]);
                    
                    AND cin3_(tmp_[0],P[0],P[1]);
                    AND cin3(tmp[3],tmp_[0],C0);
                    AND cin4_(tmp_[1],P[1],P[2]);
                    AND cin4(tmp[4],tmp_[1],G[0]);
                    
                    AND4 cin5(tmp[5],C0,P[0],P[1],P[2]);
                    // c(+)
                    OR cout0(C[1],G[0],tmp[0]);
                    OR cout1_(tmp2,G[1],tmp[1]);
                    OR cout1(C[2],tmp2,tmp[3]);
                    OR4 cout2(C3,G[2],tmp[2],tmp[4],tmp[5]);
                    
                    // s
                    FA fa0(x, S[0], A[0], B[0], C0);
                    FA fa1(x, S[1], A[1], B[1], C[1]);
                    FA fa2(x, S[2], A[2], B[2], C[2]);
                    
                endmodule
                    
                    `endif
