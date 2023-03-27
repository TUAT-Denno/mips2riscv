`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/01 22:28:14
// Design Name: 
// Module Name: cpu_ALU
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


parameter ALUOpeLen = 4;


module cpu_ALU(
    input [ALUOpeLen - 1:0] ALUOpe,
    input [31:0] ALUIn1, ALUIn2,
    output [31:0] ALUOut,
    output zeroFlag, overflowFlag
    );

reg [31:0] ALUOutReg;

always @(ALUOpe or ALUIn1 or ALUIn2) begin
    case(ALUOpe)
    4'b0000 : ALU <= ALUIn1 & ALUIn2;
    4'b0001 : ALU <= ALUIn1 | ALUIn2;
    default : ALUOutReg <= 0;
    endcase
end









endmodule
