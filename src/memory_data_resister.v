`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/30 12:45:10
// Design Name: 
// Module Name: memory_data_resister
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


module mdr(
    input CLK,
    input [31:0] dataIn,
    output reg [31:0] dataOut
);


always @(posedge CLK)
    dataOut <= dataIn;
endmodule
