`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/23 09:00:39
// Design Name: 
// Module Name: risc_v_cpu
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


module risc_v_cpu(
    input CLK,
    input RES,
    output [31:0] check
);


wire memRead, memWrite;
wire [31:0] memAddr, memDataIn;

wire [31:0] memDataOut;


cpu_core core(
    .CLK(CLK),
    .RES(RES),
    .memDataOut(memDataOut),
    .memRead(memRead),
    .memWrite(memWrite),
    .memAddr(memAddr),
    .memDataIn(memDataIn),
    .check(check)
);


memory memory(
    .CLK(CLK),
    .read(memRead),
    .write(memWrite),
    .addr(memAddr),
    .dataIn(memDataIn),
    .dataOut(memDataOut)
);
endmodule
