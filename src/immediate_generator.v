`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/14 13:18:45
// Design Name: 
// Module Name: immediate_generator
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


module immediate_generator(
    input [31:0] inst,
    output reg [31:0] imm
);


always @(inst) begin
    case(inst[6:0])
        R_TYPE :
            imm <= 32'h0;
            
        I_TYPE_CALCUTATION, I_TYPE_JALR, LOAD :
            imm <= { { 21{ inst[31] } }, inst[30:20] };
            
        STORE :
            imm <= { { 21{ inst[31] } }, inst[30:25], inst[11:7] };
            
        B_TYPE :
            imm <= { { 20{ inst[31] } }, inst[7], inst[30:25], inst[11:8], 1'b0 };
            
        J_TYPE : 
            imm <= { { 12{ inst[31] } }, inst[19:12], inst[20], inst[30:21], 1'b0 };
    endcase
end
endmodule