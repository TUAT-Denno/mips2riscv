`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/07 11:54:22
// Design Name: 
// Module Name: control_unit
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


`include "define_constant.v"


parameter FETCH = 3'b001;
parameter DECODE = 3'b010;
parameter EXECUTE = 3'b011;
parameter MEM_ACCESS = 3'b100;
parameter WRITEBACK = 3'b101;


module control_unit(
    input CLK, RES,
    input [6:0] opcode,
    input overflow,
    output reg instWrite, 
    output reg [3:0] instType,
    output reg regWrite, aluSrcA,
    output reg [1:0] aluSrcB,
    output reg memRead, memWrite, memToReg,
    output reg isFetch, isJump, isBranch
);

reg [2:0] stateReg, nextState;


always @(posedge CLK or posedge RES) begin
    if(RES == 1'b1)
        stateReg <= FETCH;
    else
        stateReg <= nextState;
end


always @(stateReg or opcode) begin  //ó‘Ô‘JˆÚ
    case(stateReg)
        FETCH :
            nextState <= DECODE;
            
        DECODE :
            nextState <= EXECUTE;
            
        EXECUTE : begin
            case(opcode)
                `OP_R_TYPE, `OP_I_TYPE_CALC, `OP_I_TYPE_JALR, `OP_J_TYPE :
                    nextState <= WRITEBACK;
            
                `OP_B_TYPE :
                    nextState <= FETCH;
                    
                default :
                    nextState <= MEM_ACCESS;
            endcase
        end
        
        MEM_ACCESS : begin
            case(opcode)
                `OP_STORE :
                    nextState <= FETCH;
                    
                default :
                    nextState <= WRITEBACK;
            endcase
        end
        
        WRITEBACK :
            nextState <= FETCH;
    endcase
end


always @(stateReg or opcode) begin  //ó‘Ô‚É‰ž‚¶‚½M†‚ÌØ‚è‘Ö‚¦//WARNING
    instWrite <= 1'b0;
    instType <= 4'b0;
    regWrite <= 1'b0;
    aluSrcA <= 1'b0;
    aluSrcB <= 2'b0;
    memRead <= 1'b0;
    memWrite <= 1'b0;
    memToReg <= 1'b0;
    isFetch <= 1'b0;
    isJump <= 1'b0;
    isBranch <= 1'b0;
    
    case(stateReg)
        FETCH : begin
           instWrite <= 1'b1;
           isFetch <= 1'b1;
        end
        
        DECODE : begin
        end
        
        EXECUTE : begin
            case(opcode)
                `OP_R_TYPE : begin
                    instType <= INST_R_TYPE;
                end
                
                `OP_I_TYPE_CALC : begin
                    instType <= INST_I_TYPE_CALC;
                    aluSrcB <= 2'b01;
                end
                
                `OP_I_TYPE_JALR : begin
                    instType <= INST_I_TYPE_JALR;
                    aluSrcA <= 1'b1;
                    aluSrcB <= 2'b10;
                    isJump <= 1'b1;
                end
                
                `OP_LOAD : begin
                    instType <= INST_LOAD;
                    aluSrcB <= 2'b01;
                end
                
                `OP_STORE : begin
                    instType <= INST_STORE;
                    aluSrcB <= 2'b01;
                end
                
                `OP_B_TYPE : begin
                    instType <= INST_B_TYPE;
                    isBranch <= 1'b1;
                end
                
                `OP_J_TYPE : begin
                    instType <= INST_J_TYPE;
                    aluSrcA <= 1'b1;
                    aluSrcB <= 2'b10;
                    isJump <= 1'b1;
                end
                
                default : begin
                    instType <= 4'b0000;
                end
            endcase
        end
        
        MEM_ACCESS : begin
            case(opcode)
                `OP_LOAD: begin
                    memRead <= 1'b1;
                end
                
                `OP_STORE: begin
                    memWrite <= 1'b1;
                end

                default: begin
                end
            endcase
        end
        
        WRITEBACK : begin
            case(opcode)
                `OP_R_TYPE, `OP_I_TYPE_CALC, `OP_I_TYPE_JALR, `OP_J_TYPE : begin
                    regWrite <= 1'b1;
                end
                
                `OP_LOAD : begin
                    regWrite <= 1'b1;
                    memToReg <= 1'b1;
                end
                
                default : begin
                end
            endcase
        end
        
        default : begin
        end
    endcase
end
endmodule
