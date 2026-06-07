#_________________________________________________Exercise 02_______________________________________________________
#.____________ Function: sortFloatArray ________________________________________________________________.
    #/* 1. Take array size (n) and base address */
    #/* 2. Apply bubble sort */
    #/* 3. Compare adjacent elements */
    #/* 4. Swap if needed */
    #/* 5. Sort in ascending order */

.text
.globl sortFloatArray

sortFloatArray:

move $t0,$a0     # n
move $t1,$a1     # base address

li $t2,0         # i = 0

outer_loop:

beq $t2,$t0,end_sort

li $t3,0         # j = 0

inner_loop:

sub $t4,$t0,$t2
addi $t4,$t4,-1

beq $t3,$t4,next_outer

# calculating address of A[j]
mul $t5,$t3,4
add $t5,$t5,$t1

# calculating address of A[j+1]
addi $t6,$t5,4

# loading float values
l.s $f1,0($t5)
l.s $f2,0($t6)

# condition ---> if A[j] > A[j+1]
c.le.s $f1,$f2
bc1t no_swap   # if true then no swap

# swapping values
s.s $f2,0($t5)
s.s $f1,0($t6)

no_swap:

addi $t3,$t3,1
j inner_loop

next_outer:

addi $t2,$t2,1
j outer_loop

end_sort:

jr $ra