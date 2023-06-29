`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2022 01:42:23 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem(input [`IR_funct3]funct3 ,input clk, input MemRead, MemWrite,input [7:0] addr, input [31:0] data_in, output reg [31:0] data_out);
 reg [7:0] mem [0:255];

 always @(posedge clk)
    
     begin
     if (MemWrite)
         begin
         case(funct3)
                3'b_000: mem[addr] <= data_in[7:0];
                3'b_001: begin mem[addr]  <= data_in[7:0]; mem[addr+1] <= data_in[15:8]; end
                3'b_010: begin mem[addr]  <= data_in[7:0]; mem[addr+1] <= data_in[15:8]; mem[addr+2] <= data_in[23:16]; mem[addr+3] <= data_in[31:24]; end
         endcase   
         end
     end
    
always @(*)
         
          begin
          if (MemRead)
              begin
              case(funct3)
                     3'b_000: data_out ={ {24{mem[addr][7]}}, mem[addr]};
                     3'b_001: begin data_out = { {16{mem[addr+1][7]}}, mem[addr+1], mem[addr]}; end
                     3'b_010: begin data_out = { mem[addr+3],mem[addr+2], mem[addr+1], mem[addr]}; end
                     3'b_100: data_out ={ {24{1'b0}}, mem[addr]};
                     3'b_101: begin data_out = { {16{1'b_0}}, mem[addr+1], mem[addr]}; end
              default:data_out=0; 
              endcase   
                            
              end
              else data_out=0;
          end
             
initial begin
  mem[0]=8'd17;
  mem[1]=8'd0;
  mem[2]=8'd0;
  mem[3]=8'd0;
  
  mem[4]=8'd9;
  mem[5]=8'd0;
  mem[6]=8'd0;
  mem[7]=8'd0;
  
  mem[8]=8'd25;
  mem[9]=8'd0;
  mem[10]=8'd0;
  mem[11]=8'd0;
 
 //-1 
  mem[12]=8'hff;
  mem[13]=8'hff;
  mem[14]=8'hff;
  mem[15]=8'hff;
  
 //7680
   mem[16]=8'h00;
   mem[17]=8'h1e;
   mem[18]=8'h00;
   mem[19]=8'h00;
   
 //1000000001  
   
   mem[20]=8'h01;
   mem[21]=8'hca;
   mem[22]=8'h9a;
   mem[23]=8'h3b;
   
   //binary 11111111111111111
   mem[24]=8'hff;
   mem[25]=8'hff;
   mem[26]=8'hff;
   mem[27]=8'h00;

   mem[28]=8'hff;
   mem[29]=8'hff;
   mem[30]=8'hff;
   mem[31]=8'h00;

   mem[32]=8'h1C;
   mem[33]=8'h00;
   mem[34]=8'h00;
   mem[35]=8'h00;
end

 endmodule

