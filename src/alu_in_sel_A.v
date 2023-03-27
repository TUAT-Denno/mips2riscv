`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 17:02:11
// Design Name: 
// Module Name: alu_in_sel_A
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


module alu_in_sel_A(
    input [31:0] regA, PC,
    input aluSrcA,
    output [31:0] aluIn1
);


assign aluIn1 = (aluSrcA == 1'b0) ? regA : PC;
endmodule
