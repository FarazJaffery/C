.globl factorial

.data
n: .word 8

.text
main:
    la t0, n       # Load the address of 'n' into t0. This gets the memory location of the input value.
    lw a0, 0(t0)   # Load the word from address in t0 into a0. This loads the input value into a0 to pass to the function.
    jal ra, factorial

    addi a1, a0, 0  # Copying the return value in a0 into a1 for printing.
    addi a0, x0, 1  # a0 = 1 is print integer ecall. Prints the result.
    ecall # Print Result

    addi a1, x0, '\n' # x0 is hardwired to 0, this just loads the ascii value of '\n' into a1.
    addi a0, x0, 11   # The value 11 corresponds to the print character ecall in RISC-V.
    ecall # Print newline

    addi a0, x0, 10   # a0=10 is exit ecall. Terminates program
    ecall # Exit

factorial:
       # YOUR CODE HERE  
    bne  a0, x0, else  # check if a0 is not zero
    addi a0, x0, 1 # base case: return 1
    j end # skip the else branch and go to end
   
else:
    addi t0, a0, 0    # t0 = n
    addi a0, a0, -1   # a0 = n - 1
    addi sp, sp, -12 # allocate space on the stack for three words
    sw ra, 8(sp) # save the return address on the stack 
    sw a0, 4(sp) # save the argument on the stack
    sw t0, 0(sp) # save the temporary register on the stack
    jal ra factorial 
    lw t0, 0(sp) # restore the original argument from the stack
    mul a0, a0, t0 # multiply the return value by t0 and store it in a0
    
end:
    lw ra, 8(sp) # restore the return address on the stack
    lw t0, 0(sp) # restore the temporary register on the stack
    addi sp, sp, 12 # deallocate space on the stack
    jr ra

    