`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/16 19:45:34
// Design Name: 
// Module Name: alu_in1_selector
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


module alu_in1_selector(
    input aluIn1Sel,
    input [31:0] regReadData1, PC,
    output [31:0] aluIn1
);


assign aluIn1 = regReadData1;
endmodule