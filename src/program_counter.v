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
    input [31:0] pcNext,  //����PC
    input pcWrite,  //pcWrite: 1�̏ꍇ��PC��pcNext�ŏ㏑��
    output reg [31:0] PC
);


always @(posedge CLK) begin
    if(RES == 1'b1)  //���Z�b�g���APC��0�Ƀ��Z�b�g
        PC <= 32'h0;
        
    //else if(pcWrite == 1'b1)  //PC��ύX
        //PC <= pcNext;
        
    else  //PC���ێ�
        PC <= PC;
end

always @(posedge pcWrite) 
    PC <= pcNext;
endmodule
