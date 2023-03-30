`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/01 22:48:26
// Design Name: 
// Module Name: alu_controller
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


module alu_controller(
    input [3:0] instType,
    input [2:0] func3,
    input [6:0] func7,
    output reg [3:0] aluControl,
    output reg reversedZFlag
);


always @(instType or func3 or func7) begin//WARNING
    case(instType)
        `INST_R_TYPE, `INST_I_TYPE_CALC : begin
            reversedZFlag <= 1'b0;
        
            case(func3)
                3'b000 :
                    aluControl <= (instType == `INST_R_TYPE && func7[5] == 1'b1) ? `SUB : `ADD;
                
                3'b001 :
                    aluControl <= `SLL;
                
                3'b010 :
                    aluControl <= `SLT;
                
                3'b011 :
                    aluControl <= `SLTU;
                    
                3'b100 :
                    aluControl <= `XOR;
                    
                3'b101 :
                    aluControl <= (func7[5] == 1'b0) ? `SRL : `SRA;
                    
                3'b110 :
                    aluControl <= `OR;
                    
                3'b111 :
                    aluControl <= `AND;
            endcase
        end
        
        `INST_I_TYPE_JALR, `INST_LOAD, `INST_STORE, `INST_J_TYPE : begin
            reversedZFlag <= 1'b0;
        
            aluControl <= `ADD;
        end
        
        `INST_B_TYPE : begin
            case(func3)
                3'b000 : begin
                    reversedZFlag <= 1'b0;
                    aluControl <= `SUB;
                end
                
                3'b001 : begin
                    reversedZFlag <= 1'b1;
                    aluControl <= `SUB;
                end
                
                default :
                    aluControl <= 4'b0000;
            endcase
        end
        
        default :
            aluControl <= 4'b0000;
    endcase
end
endmodule