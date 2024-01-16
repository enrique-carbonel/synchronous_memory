`timescale 1ns / 1ps

module syn_Mem_64Byte (read_data, write_data, address, read_enable, write_enable, reset, clk);

    output [7:0] read_data; // Read Data of 8 bits to store the write_data of 8 bits.
    input [7:0] write_data; // Write Data to send 8 bits to the write data.
    input [5:0] address; // Address that will be given to the memory to access the address that we want.
    input read_enable, write_enable, reset, clk; // Read_enable and write_enable are true and false values that will determine if the memory will read or write.
                                                 // Reset variable that will reset the memory and clean it. Meanwhile, clk will trigger once it's on positive ecge.
    
    reg [7:0] memoria [63:0]; //register that will be the memory. This memory is an array of 64 elements, each element able to store 8 bits.
    
    integer x; //integer.
    
    always @ (posedge clk) //always that the clock is a the positive edge, a condition will occur.
    begin
        if(write_enable) // If write_enable is true (1) the if statement will go through.
        begin
            memoria[address] <= write_data; // If write_enable is true (1), then the write_data will replace whatever is inside the element [address] in the memory.
        end
    end
    
    assign reset = 1'b1;
    
    always @ (reset) //everytime that reset changes, a condition will occur
    begin
        if (reset) // If the signal of reset is true, an condition will occur.
        begin
            for (x = 0; x < 63; x = x + 1) // For Loop condition from 0 to 63
            begin
                memoria[x] <= 0; // If reset is true (1), then 0 will replace whatever is inside the element [adress] in the memory.
            end
        end
    end

    assign read_data = (~write_enable && read_enable) ? memoria[address] : 8'd0;
    // If write_enable and read_enable are true, then read_data is equal to whatever is inside the element [address] of memoria.
    // On the contrary, if write_enable and read_enable are false, then read_data is equal to 0.

endmodule