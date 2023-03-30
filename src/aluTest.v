`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/30 14:42:25
// Design Name: 
// Module Name: aluTest
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


module aluTest(
);


alu alu(
    .aluIn1(aluIn1),
    .aluIn2(aluIn2),
    .aluControl(aluControl),
    .aluOut(aluOut),
    .zeroFlag(zeroFlag),
    .overflow(overflow)
);

reg [3:0] aluControl;
reg [31:0] aluIn1, aluIn2;
wire [31:0] aluOut;
wire zeroFlag, overflow;



initial begin
    aluIn1 = 0;
    aluIn2 = 0;
    aluControl = 0;
    
    #100 aluControl = 1;
    #100 aluIn1 = 10;
    #100 aluIn2 = 10;
    #100 aluControl = 2;
    #100 aluIn1 = 9;
    #100 aluIn2 = 32'hffffffff;
    #100 aluControl = 4;
    #100 aluControl = 5;
    #100 $finish;
    



end
endmodule
