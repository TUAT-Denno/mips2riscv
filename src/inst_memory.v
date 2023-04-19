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


//assign inst = {instMem[PC], instMem[PC+1], instMem[PC+2], instMem[PC+3]};


//デバッグ用
assign inst = (PC == 32'h0) ? 32'b000000000001_00000_000_00001_0010011 : //addi x1,x0,1
              (PC == 32'h4) ? 32'b000000001010_00000_000_00010_0010011 : //addi x2,x0,10
              (PC == 32'h8) ? 32'b0000000_00000_00000_000_01000_0110011 :  //add x8,x0,x0
              //loop
              (PC == 32'hc) ? 32'b000000000001_01000_000_01000_0010011 :  //addi x8,x8,1
              (PC == 32'h10) ? 32'b000000000001_00001_000_00001_0010011 :  //addi x1,x1,1
              (PC == 32'h14) ? 32'b1111111_00001_00010_001_11001_1100011 :  //bne x1,x2,-8
              (PC == 32'h18) ? 32'b0000000_00000_00000_000_00000_1100011 :  //beq x0,x0,0
              32'b0;
endmodule
