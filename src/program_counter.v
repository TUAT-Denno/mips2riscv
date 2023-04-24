`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/16 20:48:46
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input CLK, RES,
    input [31:0] targetAddr,
    input pcWrite,  //pcWrite: 1の場合にPCをpcNextで上書き
    input pcSrc,
    output reg [31:0] PC
);

reg [31:0] pcPlusFour;
wire [31:0] pcNext;


//PC_SELECTOR
always @(posedge CLK) begin
    if(RES == 1'b1)
        pcPlusFour <= 32'h0;
end

always @(negedge CLK) begin
    if(pcWrite == 1'b1)
        pcPlusFour <= PC + 32'h4;
end

assign pcNext = (pcSrc == 1'b0) ? pcPlusFour : targetAddr;


//PC
always @(posedge CLK) begin
    if(RES == 1'b1)  //リセット時、PCを0にリセット
        PC <= 32'h0;
        
    //else if(pcWrite == 1'b1)  //PCを変更
        //PC <= pcNext;
        
    else  //PCを維持
        PC <= PC;
end

always @(posedge pcWrite) 
    PC <= pcNext;
endmodule
