`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/01 22:47:13
// Design Name: 
// Module Name: register_file
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


module register_file(
    input CLK,
    input [4:0] rs1, rs2, rd,
    input write,
    input [31:0] dataIn,
    output [31:0] dataOut1, dataOut2,
    output [31:0] check
);

reg [31:0] register[31:0];


assign dataOut1 = (rs1 == 5'b00000) ? 32'h0 : register[rs1];
assign dataOut2 = (rs2 == 5'b00000) ? 32'h0 : register[rs2];

//デバッグ用
assign check = register[8];

always@(posedge CLK) begin
    if(write == 1'b1)
        register[rd] <= dataIn;
end
endmodule