`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/23 09:37:34
// Design Name: 
// Module Name: cpu_core
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


module cpu_core(
    input CLK, RES,
    input [31:0] memDataOut,
    output memRead, memWrite,
    output [31:0] memAddr, memDataIn,
    output [31:0] check
);


wire [31:0] pcNext;

wire [31:0] PC;

wire [31:0] inst;

wire [31:0] PCWireFd;
wire [6:0] inst31_25;
wire [4:0] inst24_20, inst19_15;
wire [2:0] inst14_12;
wire [4:0] inst11_7;
wire [6:0] inst6_0;
wire [31:0] imm;

wire [31:0] regA, regB;

wire instWrite;
wire [3:0] instType;
wire regWrite, aluSrcA;
wire [1:0] aluSrcB;
wire memToReg;
wire isFetch, isJump, isBranch;
wire pcSrc, pcWrite;

wire [3:0] aluControl;
wire reversedZFlag;

wire [31:0] aluIn1;

wire [31:0] aluIn2;

wire [31:0] aluOut;
wire zeroFlag, overflow;

wire [31:0] targetAddr;

wire [31:0] mdrDataOut;

wire [31:0] regDataIn;


////////FETCH////////
pc_selector pcSelector(
    .pcPlusFour(PC + 32'h4),
    .targetAddr(targetAddr),
    .pcSrc(pcSrc),
    .pcNext(pcNext)
);


program_counter programCounter(
    .CLK(CLK),
    .RES(RES),
    .pcNext(pcNext),
    .pcWrite(pcWrite),
    .PC(PC)
);


inst_memory instMemory(
    .PC(PC),
    .inst(inst)
);


fd_register fdRegister(
    .CLK(CLK),
    .PC(PC),
    .inst(inst),
    .instWrite(instWrite),
    .PCRegFd(PCWireFd),
    .inst31_25(inst31_25),
    .inst24_20(inst24_20),
    .inst19_15(inst19_15),
    .inst14_12(inst14_12),
    .inst11_7(inst11_7),
    .inst6_0(inst6_0),
    .imm(imm)
);


////////DECODE////////
register_file registerFile(
    .CLK(CLK),
    .rs1(inst19_15),
    .rs2(inst24_20),
    .rd(inst11_7),
    .write(regWrite),
    .dataIn(regDataIn),
    .dataOut1(regA),
    .dataOut2(regB),
    .check(check)
);


control_unit controlUnit(
    .CLK(CLK),
    .RES(RES),
    .opcode(inst6_0),
    .overflow(overflow),
    .instWrite(instWrite), 
    .instType(instType),
    .regWrite(regWrite),
    .aluSrcA(aluSrcA),
    .aluSrcB(aluSrcB),
    .memRead(memRead),
    .memWrite(memWrite),
    .memToReg(memToReg),
    .isFetch(isFetch),
    .isJump(isJump),
    .isBranch(isBranch)
);


alu_controller aluController(
    .instType(instType),
    .func3(inst14_12),
    .func7(inst31_25),
    .aluControl(aluControl),
    .reversedZFlag(reversedZFlag)
);


assign pcSrc = ( zeroFlag ^ reversedZFlag) & isBranch | isJump;
assign pcWrite = pcSrc | isFetch;


////////DE_REGISTER////////
reg [31:0] PCRegDe;
reg [31:0] regARegDe, regBRegDe, immRegDe;
wire [31:0] PCWireDe;
wire [31:0] regAWireDe, regBWireDe, immWireDe;


always @(posedge CLK) begin
    PCRegDe <= PC;
    regARegDe <= regA;
    regBRegDe <= regB;
    immRegDe <= imm;
end

assign PCWireDe = PCRegDe;
assign regAWireDe = regARegDe;
assign regBWireDe = regBRegDe;
assign immWireDe = immRegDe;
///////////////////////////


////////EXECUTE////////
alu_in_sel_A aluInSelA(
    .regA(regAWireDe),
    .PC(PC),
    .aluSrcA(aluSrcA),
    .aluIn1(aluIn1)
);


alu_in_sel_B aluInSelB(
    .regB(regBWireDe),
    .imm(immWireDe),
    .four(32'h4),
    .aluSrcB(aluSrcB),
    .aluIn2(aluIn2)
);


alu alu(
    .aluIn1(aluIn1),
    .aluIn2(aluIn2),
    .aluControl(aluControl),
    .aluOut(aluOut),
    .zeroFlag(zeroFlag),
    .overflow(overflow)
);


pc_adder pcAdder(
    .PC(PCWireDe),
    .regA(regAWireDe),
    .imm(immWireDe),
    .instType(instType),
    .targetAddr(targetAddr)
);


////////EM_REGISTER////////
reg [31:0] aluOutRegEm, memDataInRegEm;
wire [31:0] aluOutWireEm;


always @(posedge CLK) begin
    aluOutRegEm <= aluOut;
    memDataInRegEm <= regBWireDe;
end

assign aluOutWireEm = aluOutRegEm;
assign memDataIn = memDataInRegEm;  //output memDataIn
///////////////////////////


////////MEM_ACCESS////////
assign memAddr = aluOutWireEm;


mdr mdr(
    .CLK(CLK),
    .dataIn(memDataOut),
    .dataOut(mdrDataOut)
);


////////WRITEBACK////////
assign regDataIn = (memToReg == 1'b0) ? aluOutWireEm : mdrDataOut;
endmodule
