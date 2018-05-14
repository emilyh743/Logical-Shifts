# Logical-Shifts

Computer Organization course assignment in C and MIPS.

ex1.c 

Program that reads a sequence of decimal numbers on the standard input (one per line), and prints the 16-bit binary representation of each number (one per line), until a 0 is read on the input. The numbers entered may be positive or negative, but you can assume they will be within the range of 16-bit binary numbers (-2^15 to 2^15-1).

ex1.asm

MIPS equivalent of ex1.c

Program to write a pseudo-random number generator (PRNG) using the classic linear feedback shift-register (LFSR) technique.
Focus on random numbers in the range 1 to 31 only. Given a starting value (sometimes called the "seed") in the range 1..31, the algorithm generates a succession of random numbers in that range, going through all the 31 values, until the starting value is reached again, at which time the program terminates.

The algorithm works as follows. Suppose the current random number is R. Let us represent its binary form using 5 bits, as R4R3R2R1R0. The next random number in the sequence is produced by shifting R to the left by one bit position, and inserting a new bit B into the LSB position. The value of B is given by the XOR of R4 and R2.

ex2.c

A C language implementation of the PRNG is provided (ex2.c). Task was to write an equivalent MIPS program.

ex2.asm

MIPS equivalent of ex2.c
