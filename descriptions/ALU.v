`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2022 12:08:28 PM
// Design Name: 
// Module Name: ALU
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

`include "defines.v"

module ALU(
	input   wire [31:0] a, b,
	input    itype,  rtype,    //r>> b[4:0], i[shamt]
	input   wire [4:0]  shamt,
	input   wire [3:0]  alufn,
	output  reg  [31:0] r,
	output  wire        cf, zf, vf, sf
);
    
    wire [31:0] add, sub, op_b;
    wire cfa, cfs;
    wire [4:0] shift_amount;
    assign op_b = (~b);
    
    assign {cf, add} = alufn[0] ? (a + op_b + 1'b1) : (a + b);
    
    assign zf = (add == 0);
    assign sf = add[31];
    assign vf = (a[31] ^ (op_b[31]) ^ add[31] ^ cf);
    
    wire[31:0] sh;
    assign shift_amount = (itype) ? shamt : b[4:0];
    shifter shifter0(a, alufn[1:0] ,shift_amount ,  sh);
    always@(*)
    begin
    

        r = 0;
        (* parallel_case *)
        case (alufn)
            // arithmetic
            4'b00_00 : r = add;
            4'b00_01 : r = add;
            4'b00_11 : r = b;
            // logic
            4'b01_00:  r = a | b;
            4'b01_01:  r = a & b;
            4'b01_11:  r = a ^ b;
            
            // shift
            4'b10_00:  r=sh;
            4'b10_01:  r=sh;
            4'b10_10:  r=sh;
            
            // slt & sltu
            4'b11_01:  r = {31'b0,(sf != vf)}; 
            4'b11_11:  r = {31'b0,(~cf)};            	
        endcase
    end
endmodule