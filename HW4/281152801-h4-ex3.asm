#_________________________________________________Exercise 03_______________________________________________________
#.____________ Function: printFloatArray ________________________________________________________________.
    #/* 1. Take array size (n) and base address */
    #/* 2. Traverse array */
    #/* 3. Print each float value */
    #/* 4. Print each value on new line */

.data
newline: .asciiz "\n"

.text
.globl printFloatArray

printFloatArray:

move $t0,$a0     # n
move $t1,$a1     # base address

li $t2,0         # i = 0

loop_print:

beq $t2,$t0,end_print

# calculating address
mul $t3,$t2,4
add $t3,$t3,$t1

# loading float
l.s $f12,0($t3)

# print float
li $v0,2
syscall  

# print newline
li $v0,4
la $a0,newline
syscall

addi $t2,$t2,1
j loop_print

end_print:

jr $ra