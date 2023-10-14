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

  addi t0, x0, 1       # i = 1
  addi t1, x0, 1       # result = 1
  
loop:
  bgt t0, a0, exit     # if i > n, exit loop
  
  mul t1, t1, t0       # result *= i
  
  addi t0, t0, 1       # i++
  jal x0, loop
  
exit:
  add a0, t1, x0       # return result
  ret