# synchronous_memory
This Verilog project design a 64-byte synchronous memory. This project was made for my Introduction to VLSI Design class.

The first step was to declare the outputs and the inputs. Once that was done, it was required to build a register that could fit a total of 64
elements, which could store 8 bits of data. Once that was done, we needed to create an if condition whenever the edge of the clock was positive, we would adhere the write data to the memory of the specified address. Once that was done, we also needed to make the reset to clear the memory. Lastly, we needed to make the read data and if  statement that goes like this: “ If write_enable and read_enable are true, then read_data is equal to whatever is inside the element [address] of the memory. On the contrary, if write_enable and read_enable are false, then read_data is equal to high impedance.
