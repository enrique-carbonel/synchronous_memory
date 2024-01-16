`timescale 1ns / 1ps
module Syn_Mem_64Byte_Testbench();
    reg clk, reset, write_enable, read_enable;
    reg [5:0] address;
    reg [7:0] write_data;
    wire [7:0] read_data;
    syn_Mem_64Byte syn_Mem_64Byte_0 (read_data, write_data, address, read_enable, write_enable, reset, clk);
    initial 
    begin
    clk         <= 1'b0; 
    reset        <= 1'b1;
    write_enable    <= 1'b0; 
    read_enable    <= 1'b0;
    address        <= 6'd0;
    write_data    <= 8'd0;
    #10; 
    reset           <= 1'b0;
    write_enable    <= 1'b1;
    read_enable    <= 1'b0;
    address        <= 6'd0;
    write_data    <= 8'b11111111;
    #10;
    write_enable    <= 1'b0;
    read_enable    <= 1'b1;
    address        <= 6'd0;
    write_data    <= 8'b11111111;
    #10;   
    write_enable    <= 1'b1;
    read_enable    <= 1'b1;
    address        <= 6'd2;
    write_data    <= 8'b11111100;
    #10 
    write_enable    <= 1'b1;
    read_enable    <= 1'b0;
    address        <= 6'd3;
    write_data    <= 8'b11111000;
    #10 
    write_enable    <= 1'b0;
    read_enable    <= 1'b1;
    address        <= 6'd3;
    write_data    <= 8'b11110000;
    #10
    
    reset        <= 1'b1;
    address        <= 6'd15;
    write_data    <= 8'b11100000;    
    end
    
    always #5 clk = ~clk;   
endmodule
