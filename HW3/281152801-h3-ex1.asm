
# Exercise 1: Leap Year

.data 
leapyear: .asciiz "Enter your year: "

.text
main:
li $v0 ,  4
la $a0 , leapyear 
syscall 

li $v0 , 5
syscall 
move $t0 , $v0 

# if (year % 400 == 0)
#     return 1;
# else if (year % 4 == 0 && year % 100 != 0)
#     return 1;
# else
#     return 0;

li $t1 , 400 # hard coded 400  in t1 

div $t0 , $t1    #year % 400 
mfhi $t2              # storing result in t2 

beq $t2 , $zero , return_c1_1    # (year % 400) == 0

# else part 
li $t3 , 4            # hard coded 4  in t3

div $t0 , $t3    #year % 4
mfhi $t2              # storing result in t2
beq $t2 , $zero , divide_by_100


li $t9 , 0     # returning 0 value and stroing in t9 register 
j return 

divide_by_100:
li $t1 , 100          # hard coded 100  in t1  -- temparary register van be use repeatedly
div $t0 , $t1   #year % 100 
mfhi $t3              # storing result in t3

bne		$t3, $zero, return_c2_1	# if $t2 == $t3   goto target return_c2_1 

return_c2_1:    # returning 1 value and stroing in t9 register 
li $t9 , 1
j return 

return_c1_1:    # returning 1 value and stroing in t9 register 
li $t9 , 1 
j return 

return:            # return value printed 
li $v0 ,1
move $a0 , $t9 
syscall 

done:          # terminator 
li $v0 , 10 
syscall



