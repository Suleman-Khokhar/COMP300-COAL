#_________________________________________________Task 01_______________________________________________________
#.________________ Implement the following pseudo-code in MIPS assembly language__________________________.
	#/* 1. Get an integer value from keyboard and store it in variable x */
	#/* 2. Get an integer value from keyboard and store it in variable y */
	#/* 3. Get an integer value from keyboard and store it in variable z */
		#if ( ( x < 10 ) || ( ( y != 4 ) && ( z > 2 ) ) {
			#print on console "I am feeling good .\n"
		#} else {
			#print on console "I am feeling drowsy .\n"
			#}
		#print on console "End of program \n"

#li $v0,1#move $a0,$t0#syscall

.data 
x: .asciiz "Enter value of x : "
y: .asciiz "Enter value of y : "
z: .asciiz "Enter value of z : "
mess_1: .asciiz "I am feeling good .\n"
mess_2: .asciiz "I am feeling drowsy .\n"
end: .asciiz "End of program \n"
.text 
main:

li $v0,4
la $a0,x
syscall

li $v0,5
syscall
move $t0,$v0      # storing the x value in t0 register 

li $v0,4
la $a0,y
syscall

li $v0,5
syscall
move $t1,$v0      # storing the y value in t1 register


li $v0,4
la $a0,z
syscall

li $v0,5
syscall
move $t2,$v0      # storing the z value in t2 register

#condition ----->  if (( x < 10 ) || (( y != 4 )&&( z > 2 )))

slti $t3 , $t0, 10  #( x < 10 ) comparing and storing result in t3

li $t4 , 1  # t4 register --> for check 2 ---> y!= 4
li $t8,4  # hardcorded value 
beq $t1,$t8, update_t4 #if the y == 4 so the branch taken and t4 = 0 and we will not update the t5 bcz in and 1-->0 result 0 

li $t5 , 0    # t5 register --> for check 3 ---> ( z > 2 )
#bgt $t5,$t2,2
li $t8,2  # hardcorded value

sgt $t5,$t2,$t8 # if z>2 then the t5 is 1 
j part_2_result # then we jump to calculate the part_2 result (( y != 4 )&&( z > 2 )) 

update_t4:        #the branch taken and t4 = 0 
li $t4 ,0 
  
part_2_result:    # calculating the result of (( y != 4 )&&( z > 2 ))
and $t6,$t4,$t5       # if both result are 1 so and --> 1 if any one 0 so result t6 -->0

li $t7,0 # final result calculate  (( x < 10 ) || (( y != 4 )&&( z > 2 )))
or $t7,$t3,$t6 # if the both are 1 so one if any one is 1 so one and condition true 

beq $t7,1,if_associated_code  # check for if condition if true and associated code of if run 
                 # this is else part 
li $v0,4                  # else associated code 
la $a0,mess_2
syscall

j end_program      # end program statment label

if_associated_code:       # if associated code 
li $v0,4
la $a0,mess_1
syscall

end_program:      # end program statment 
li $v0,4
la $a0,end
syscall

li $v0,10        # program termination 
syscall

