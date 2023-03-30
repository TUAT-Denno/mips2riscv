`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 18:38:39
// Design Name: 
// Module Name: pc_adder
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


module pc_adder(
    input [31:0] PC, regA, imm,
    input [3:0] instType,
    output [31:0] targetAddr
);


assign targetAddr = (instType = `INST_I_TYPE_JALR) ? regA + imm : PC + imm;
endmodule
