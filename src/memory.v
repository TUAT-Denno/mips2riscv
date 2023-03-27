`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/23 09:00:59
// Design Name: 
// Module Name: memory
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


module memory(
    input CLK,
    input read, write,  //�ǂݍ��ݖ��߁A�������ݖ���
    input [31:0] addr, dataIn,  //�������[�A�h���X�w��A�f�[�^����
    output [31:0] dataOut  //�f�[�^�o��
);

reg [7:0] dataMem [511:0];  //�f�[�^������


assign dataOut = (read == 1'b1) ? dataOut : {dataMem[addr], dataMem[addr+1], dataMem[addr+2], dataMem[addr+3]};

always@(posedge CLK) begin
    if(write == 1'b1)
        {dataMem[addr], dataMem[addr+1], dataMem[addr+2], dataMem[addr+3]} <= dataIn;
end
endmodule