`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/23 15:59:58
// Design Name: 
// Module Name: pc_selector
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


module pc_selector(
    input [31:0] pcPlusFour, targetAddr,  //pcPlusFour: PC + 4, targetAddr: BranchÇ‹ÇΩÇÕJumpêÊÇÃÉAÉhÉåÉX
    input pcSrc,  //pcSrc: 0: pcPlusFour, 1:targetAddr
    output [31:0] pcNext
);


assign pcNext = (pcSrc == 1'b0) ? pcPlusFour : targetAddr;
endmodule
