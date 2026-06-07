#_________________________________________________Exercise 01_______________________________________________________
#.____________ Function: getFloatArray ________________________________________________________________.
    #/* 1. Take number of elements (n) from main */
    #/* 2. Allocate memory from heap (4 * n bytes) */
    #/* 3. Take float input from user one by one */
    #/* 4. Store each value in allocated memory */
    #/* 5. Return base address */

.data
prompt: .asciiz "Enter float value : "

.text
.globl getFloatArray

getFloatArray:

# saving registers 
addi $sp,$sp,-8
sw $ra,4($sp)
sw $s0,0($sp)

move $s0,$a0     # storing n in s0

# allocating memory using sbrk
li $v0,9
mul $a0,$s0,4    # 4 * n bytes
syscall

move $t0,$v0     # base address
move $t1,$t0     # pointer for storing values

li $t2,0         # loop counter i = 0

loop_input:

beq $t2,$s0,end_loop_input

# print prompt
li $v0,4
move $a0,$a1
syscall

# read float value
li $v0,6
syscall

# store float into memory
s.s $f0,0($t1)

addi $t1,$t1,4   # move to next location
addi $t2,$t2,1   # i++

j loop_input

end_loop_input:

move $v0,$t0     # returning base address

# restoring registers
lw $ra,4($sp)
lw $s0,0($sp)
addi $sp,$sp,8

jr $ra