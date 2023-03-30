`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/18 21:12:09
// Design Name: 
// Module Name: fd_register
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


module fd_register(
    input CLK,
    input [31:0] PC,
    input [31:0] inst,
    input instWrite,
    output reg [31:0] PCRegFd,
    output [6:0] inst31_25,
    output [4:0] inst24_20, inst19_15,
    output [2:0] inst14_12,
    output [4:0] inst11_7,
    output [6:0] inst6_0,
    output [31:0] imm
);

reg [31:0] instReg;


always @(posedge CLK) begin
    PCRegFd <= PC;

    if(instWrite == 1'b1)
        instReg <= inst;
        
    else begin
    end
end

assign inst31_25 = instReg[31:25];
assign inst24_20 = instReg[24:20];
assign inst19_15 = instReg[19:15];
assign inst14_12 = instReg[14:12];
assign inst11_7 = instReg[11:7];
assign inst6_0 = instReg[6:0];

assign imm = (instReg[6:0] == R_TYPE)                                        ? 32'h0 :
             (instReg[6:0] == I_TYPE_CALCUTATION && instReg[13:12] == 2'b01) ? { { 28{ instReg[24] } }, instReg[23:20] } :
             (instReg[6:0] == I_TYPE_CALCUTATION)                            ? { { 21{ instReg[31] } }, instReg[30:20] } :
             (instReg[6:0] == I_TYPE_JALR)                                   ? { { 21{ instReg[31] } }, instReg[30:20] } :
             (instReg[6:0] == LOAD)                                          ? { { 21{ instReg[31] } }, instReg[30:20] } :
             (instReg[6:0] == STORE)                                         ? { { 21{ instReg[31] } }, instReg[30:25], instReg[11:7] } :
             (instReg[6:0] == B_TYPE)                                        ? { { 20{ instReg[31] } }, instReg[7], instReg[30:25], instReg[11:8], 1'b0 } :
             (instReg[6:0] == J_TYPE)                                        ? { { 12{ instReg[31] } }, instReg[19:12], instReg[20], instReg[30:21], 1'b0 }:
             32'h0;
endmodule
