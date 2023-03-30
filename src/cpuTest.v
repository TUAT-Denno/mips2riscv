`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/30 16:25:30
// Design Name: 
// Module Name: cpuTest
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


module cpuTest();

parameter CLK_PERIOD = 10;

reg CLK, RES;
wire [31:0] check;


risc_v_cpu cpu(
    .CLK(CLK),
    .RES(RES),
    .check(check)
);


initial begin
    CLK <= 1'b0;
    RES <= 1'b1;
end

always begin
    #CLK_PERIOD CLK <= ~CLK;
end

always begin
    #10000 RES <= 1'b0;
    #10000 $finish;
end
endmodule
