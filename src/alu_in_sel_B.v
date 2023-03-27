`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 17:02:35
// Design Name: 
// Module Name: alu_in_sel_B
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


module alu_in_sel_B(
    input [31:0] regB, imm, shamt, four,
    input [1:0] aluSrcB,
    output [31:0] aluIn2
);


assign aluIn2 = (aluSrcB == 2'b00) ? regB :
                (aluSrcB == 2'b01) ? imm :
                (aluSrcB == 2'b10) ? shamt : four;
endmodule
