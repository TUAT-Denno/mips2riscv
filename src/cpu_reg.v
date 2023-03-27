`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/01 21:30:18
// Design Name: 
// Module Name: cpu_reg
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


module cpu_reg(
    input CLK,
    input [4:0] rs, rt, rd,
    input regWrite,
    input [31:0] regReadData1, regReadData2, regWriteData
);

reg [31:0] register[31:0];


always@(posedge CLK) begin
    if(regWrite == 1'b1)
        register[rd] <= regWriteData;
end

assign regReadData1 = (rs == 1'b0) ? 32'h00000000 : register[rs];
assign regReadData2 = (rt == 1'b0) ? 32'h00000000 : register[rt];
endmodule
