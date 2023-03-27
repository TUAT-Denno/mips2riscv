`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/16 19:49:29
// Design Name: 
// Module Name: alu_in2_selector
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


module alu_in2_selector(
    input [1:0] aluIn2Sel,
    input [31:0] regReadData2, immediate, shamt,
    output [31:0] aluIn2
);


assign aluIn2 = (sel2 == 2'b00) ? regReadData2 :
                (sel2 == 2'b01) ? immediate :
                (sel2 == 2'b10) ? shamt : 
                32'h0;
endmodule