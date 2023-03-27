`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/23 15:48:38
// Design Name: 
// Module Name: pc_sel
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


module pc_sel(
    input [31:0] pcPlusFour, targetAddr,
    input pcSrc,
    output [31:0] pcNext
);


assign pcNext = (pcSrc == 1'b1) ? targetAddr : pcPlusFour;
endmodule
