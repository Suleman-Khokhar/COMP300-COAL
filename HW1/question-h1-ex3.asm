# 3. Implement the following pseudo-code in MIPS assembly language.
# /* 1. Get an 32 - bit float value from keyboard and store it in variable u */
# /* 2. Get a byte or character value from keyboard and store it in variable v */
# /* 3. Get an integer value from keyboard and store it in variable w */

#    if ( ( u < 9.8 ) && ( v == ’m’ ) )      ---------> Outer_if
#           {
#               print on console "You live on Moon .\n"   ------->   Outer_if_string
#           }
#    else       ----------> outer_else
#           {
#               if ( ( u < 1.0 ) && ( w >= 1 ) ------> outer_else_if
#                     {
#                      print on console "You probably live on Pluto.\n" ------> outer_else_if_string
#                      }
#                else      -------> outer_else_else
#                       {
#                           print on console "You are an alien visiting Earth .\n"  ----> -------> outer_else_else_string
#                       }
#              }
#   print on console "End of program \n"

.data

u_prompt: .asciiz "Enter value of u : "
v_prompt: .asciiz "Enter value of v : "
w_prompt: .asciiz "Enter value of w : "

moon_string: .asciiz "You live on Moon .\n"
pluto_string: .asciiz "You probably live on Pluto .\n"
alien_string: .asciiz "You are an alien visiting Earth .\n"

end_program: .asciiz "End of program \n"

const_9_8: .float 9.8
const_1_0: .float 1.0

.text
main:

#_____________________ Taking input of u (float) _____________________

li $v0,4
la $a0,u_prompt
syscall

li $v0,6
syscall
mov.s $f2,$f0          # storing u value in f2 register


#_____________________ Taking input of v (char) _____________________

li $v0,4
la $a0,v_prompt
syscall

li $v0,12
syscall
move $t0,$v0           # storing v value in t0 register


#_____________________ Taking input of w (integer) _____________________

li $v0,4
la $a0,w_prompt
syscall

li $v0,5
syscall
move $t1,$v0           # storing w value in t1 register


##-------------------- Condition -----------------------
# if ( ( u < 9.8 ) && ( v == 'm' ) )

l.s $f4,const_9_8        # loading the signal percision in f4

c.lt.s $f2,$f4         # checking u < 9.8 if true it go down to 
bc1t u_less_9_8            #branch on coprocessor1 true go to branch --> u_less_9_8

j check_else_part      #  -- > if condition 1 part false no need to check other part 2
                            # go to else part


u_less_9_8:            # if if part -1 is true and other check like bitwise operation 

li $t4,'m'             # ASCII of m
beq $t0,$t4,if_part_true         # if equal branch taken ---->if_part_true


check_else_part:       # if branch not taken we move tocheck_else_part label

########## else part ##########
# if ( ( u < 1.0 ) && ( w >= 1 ) )

l.s $f6,const_1_0       # loading signal percision in f6

c.lt.s $f2,$f6         # checking u < 1.0  compare less then signal percisiion
bc1t u_less_1          #branch on coprocessor1 true go to branch --> u_less_1


j else_sub_part_2  # if branch not got takem 


u_less_1:     # if branch taken got true 

li $t6,1     # hard coded values 

bge $t1,$t6,pluto_string_part      # if t1 > t6 goto pluto_string_part


## main else ----> alien part

else_sub_part_2:

li $v0,4
la $a0,alien_string
syscall         # printing the alien_string 

j end_program_s


pluto_string_part:

li $v0,4
la $a0,pluto_string
syscall                 # printing the pluto_string 


j end_program_s


######### if part #########

if_part_true:

li $v0,4
la $a0,moon_string
syscall             # printing the moon_string 

j end_program_s


end_program_s:

li $v0,4
la $a0,end_program
syscall           # printing the end_program 



done:

li $v0,10
syscall            
#  program terminated 