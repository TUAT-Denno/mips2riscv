`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/01 22:44:31
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`include "define_constant.v"


module alu(
    input [31:0] aluIn1, aluIn2,
    input [3:0] aluControl,
    output reg [31:0] aluOut,
    output zeroFlag, overflow
);


assign zeroFlag = (aluOut == 32'h0) ? 1 : 0;
assign overflow = 1'b0;//WARNING


always @(aluControl or aluIn1 or aluIn2) begin//WARNING
    case(aluControl)
        ADD :
            aluOut <= aluIn1 + aluIn2;
            
        SUB : 
            aluOut <= aluIn1 - aluIn2;
            
        SLL :
            aluOut <= aluIn1 << aluIn2;
            
        SLT :
            aluOut <= ( $signed(aluIn1) < $signed(aluIn2) ) ? 32'h1 : 32'h0;
            
        SLTU :
            aluOut <= (aluIn1 < aluIn2) ? 32'h1 : 32'h0;
            
        XOR :
            aluOut <= aluIn1 ^ aluIn2;
            
        SRL : 
            aluOut <= aluIn1 >> aluIn2;
        
        SRA : 
            aluOut <= aluIn1 >>> aluIn2;
            
        OR :
            aluOut <= aluIn1 | aluIn2;
            
        AND : 
            aluOut <= aluIn1 & aluIn2;
            
        default : 
            aluOut <= 32'h0;
    endcase
end
endmodule