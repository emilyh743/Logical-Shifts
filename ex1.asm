#Lab 9: ex1.asm: Printing numbers in binary

.data 0x0   #what type of commands come next. 0x0 = where to put it. "this segment of data to be in 0x0"
newline: .asciiz "\n"
add: .asciiz "\n"     
#sgt: .asciiz "\n"
#fgt: .asciiz "\n"  
.text 0x3000    #0x3000 all data-memory

main:
        whileLoop:
                #scan int
                ori $v0, $0, 5          #scan integers
                syscall
                add $a1, $0, $v0        #store scanned input in temp reg.
                jal binary_conversion   #to binary_conversion loop
                ori $v0, $0, 4          #print newline here (not binary numbers)
                la $a0 newline
                syscall
                bne $a1, $0, whileLoop  #can't change $a1 in binary_conversion
        exit:  #terminates program if 
        li $v0, 10
        syscall
        
binary_conversion:
        ori $t0, $0, 15
        ori $t1, $0, 0x8000  #MASK
        loop:
                #operation to convert
                and $a3, $a1, $t1               #anding mask with input
                srlv $a3, $a3, $t0
                                #print digit by digit within the loop
                ori $v0, $0, 1
                or $a0, $0, $a3
                syscall
                srl $t1, $t1, 1
                #$t0--;
                addi $t0, $t0, -1       #decrement
                bne $t0, -1, loop
                
        return:
                jr $ra