
#################################################################################################3
#2. Implement the following pseudo-code in MIPS assembly language.
#/* 1. Get an integer value from keyboard and store it in variable a */
#/* 2. Get an integer value from keyboard and store it in variable b */
#/* 3. Get an integer value from keyboard and store it in variable c */
#	if ( ( a < 10 ) && ( a > -3 ) )   -----> if_part_1
#		 {
#			if ( ( b >= 0 ) && ( c <= 5 )  -----> if_sub_part_1
#				{
#					print on console "You are my friend .\n"       ---> if_sub_part_1_string
#				}
#		}
# 	else          -------> else_part_1 
#		{	
#			if ( ( b < 0 ) && ( c > 5 )   else_sub_part_1
#				{
#					print on console "You are my best friend .\n"    -------->else_sub_part_1_string   
#				}
#e			Else            -------------->else_sub_part_2
#				{
#					print on console " Ricky Ponting is my favorite cricketer .\n" --------> else_sub_part_2_string
 #				}
#		}
#	print on console "End of program \n"   ------> end_program

.data
a: .asciiz "Enter value of a :"
b: .asciiz "Enter value of b :"
c: .asciiz "Enter value of c :"
if_sub_part_1_strings: .asciiz "You are my friend .\n"
else_sub_part_1_strings: .asciiz " You are my best friend .\n"    
else_sub_part_2_strings: .asciiz  " Ricky Ponting is my favorite cricketer .\n" 
end_program: .asciiz "End of program \n"

.text
main:
li $v0,4
la $a0,a
syscall

li $v0,5
syscall
move $t0,$v0  # Taking input in a 

li $v0,4
la $a0,b
syscall

li $v0,5
syscall
move $t1,$v0  # Taking input in b

 li $v0,4
la $a0,c
syscall

li $v0,5
syscall
move $t2,$v0  # Taking input in c

##----------- Condition 
#	if ( ( a < 10 ) && ( a > -3 ) )   -----> if_part_1  

li $t3,0   # ---> Storing the if_part_1_a result in t3 register      ( a < 10 ) in t3
slti $t3,$t0,10   # if ( a < 10 ) then t3 is 1 otherwise 0 

li $t4,0   # ---> Storing the if_part_1_b result in t4 register      ( a > -3 ) in t4
sgt $t4,$t0,-3   # if ( a > -3 ) then t4 is 1 otherwise 0

li $t5,0  # stroing the complete result of  ( ( a < 10 ) && ( a > -3 ) )   -----> if_part_1
and $t5,$t3,$t4  # ((a < 10)&&(a > -3)) if both 1 so t5 is 1 otherwise 0

li $t6,1 #----> for universal true 1 checking condition

beq $t6,$t5,if_sub_part_1  # if the if_part_1 is successfully run the branch of if_sub_part_1 will be taken 
j else_part

else_part:
j else_part_1
######### else part 
# 	else          -------> else_part_1 
#		{	
#			if ( ( b < 0 ) && ( c > 5 )   else_sub_part_1
### -------> now as the regsters are already t3 t4 t5 t6 used so i can update the values ninja technique ( 0 ^ 0 )
else_part_1:
slti $t3,$t1,0          # (b < 0)  else_sub_part_1_a .... The t3 is 1 if b<0 or toherwise the 0
 
sgt $t4,$t2,5   # if ( c > 5 )else_sub_part_1_b .... then t4 is 1 otherwise 0

and $t5,$t3,$t4  # if ( ( b < 0 ) && ( c > 5 ) else_sub_part_1 ....if both 1 so t5 is 1 otherwise 0
   
beq $t6,$t5,else_sub_part_1_string  # if the else_part_1 is successfully run the branch of else_sub_part_1_string will be taken 


## main else ---->else part

#			else            -------------->else_sub_part_2
#				{
#					print on console " Ricky Ponting is my favorite cricketer .\n" --------> else_sub_part_2_string
 #				}
#		}

li $v0,4
la $a0,else_sub_part_2_strings
syscall

j end_program_s

else_sub_part_1_string:        # if ( ( b < 0 ) && ( c > 5 ) ------> else_sub_part_1_string 


li $v0,4
la $a0,else_sub_part_1_strings
syscall

j end_program_s


#	 {
#			if ( ( b >= 0 ) && ( c <= 5 )  -----> if_sub_part_1
#				{
#	
if_sub_part_1:                   #if ( (b >= 0) && ( c <= 5 )  -----> if_sub_part_1 
### -------> now as the regsters are already t3 t4 t5 t6 used so i can update the values ninja technique ( 0 ^ 0 )
 
sge $t3,$t1,$zero       # (b >= 0)  if_sub_part_1_a   if true t3 is 1 or 0

li $t7,5                     # hardcoded values of 5 in t7
sle $t4,$t2,$t7      #( c <= 5 )   if_sub_part_1_b   if true t4 is 1 or 0

and $t5,$t3,$t4  # if ( ( b >= 0 ) && ( c <= 5 )  -----> if_sub_part_1 ....if both 1 so t5 is 1 otherwise 0

beq $t6,$t5,if_sub_part_1_string  # if the if_sub_part_1 is successfully run the branch of if_sub_part_1_string will be taken 


end_program_s:
li $v0,4
la $a0,end_program
syscall
j done
 
if_sub_part_1_string:

li $v0,4
la $a0,if_sub_part_1_strings
syscall
j end_program_s


done:
li $v0,10        # program termination 
syscall

