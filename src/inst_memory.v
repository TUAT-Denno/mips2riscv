`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/23 16:02:53
// Design Name: 
// Module Name: inst_memory
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


module inst_memory(
    input [31:0] PC,
    output [31:0] inst  //ñΩóﬂ
);

reg [7:0] instMem [511:0];  //ñΩóﬂÉÅÉÇÉä


assign inst = {instMem[PC], instMem[PC+1], instMem[PC+2], instMem[PC+3]};
endmodule
