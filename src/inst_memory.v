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
    output [31:0] inst  //命令
);

reg [7:0] instMem [511:0];  //命令メモリ


assign inst = {instMem[PC], instMem[PC+1], instMem[PC+2], instMem[PC+3]};


//デバッグ用
assign {instMem[0], instMem[1], instMem[2], instMem[3]} = 32'b000000000001000000000000010000010011;
assign {instMem[4], instMem[5], instMem[6], instMem[7]} = 32'b000000000010000000000000010010010011;
endmodule
