`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/14 15:03:06
// Design Name: 
// Module Name: define_constant
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


`ifndef __DEFINE_CONSTANT__
`define __DEFINE_CONSTANT__


`define OP_R_TYPE 7'b0110011
`define OP_I_TYPE_CALC 7'b0010011
`define OP_I_TYPE_JALR 7'b1100111
`define OP_LOAD 7'b0000011
`define OP_STORE 7'b0100011
`define OP_B_TYPE 7'b1100011
`define OP_J_TYPE 7'b1101111

`define INST_R_TYPE 4'b0001
`define INST_I_TYPE_CALC 4'b0010
`define INST_I_TYPE_JALR 4'b0011
`define INST_LOAD 4'b0100
`define INST_STORE 4'b0101
`define INST_B_TYPE 4'b0110
`define INST_J_TYPE 4'b0111

`define ADD 4'b0001
`define SUB 4'b0010
`define SLL 4'b0011
`define SLT 4'b0100
`define SLTU 4'b0101
`define XOR 4'b0110
`define SRL 4'b0111
`define SRA 4'b1000
`define OR 4'b1001
`define AND 4'b1010


`endif