# import math

# def cos(x):
#     # Step 1: Normalize x to [0, 2π]
#     two_pi = 2 * math.pi

#     while x > two_pi:
#         x -= two_pi

#     while x < 0:
#         x += two_pi

#     # Step 2: Compute series
#     term = 1.0   # first term
#     result = 1.0
#     k = 1

#     delta = 0.0000001

#     while abs(term) > delta:
#         term *= - (x * x) / ((2 * k - 1) * (2 * k))
#         result += term
#         k += 1

#     return result


# # Test
# x = float(input("Enter value of x (in radians): "))
# print("cos(x) =", round(cos(x), 6))

# # Compare with built-in (just for checking)
# print("Actual =", round(math.cos(x), 6))


######## MIPS Code
.data

number: .asciiz "Enter value of x (in radians): "
result_label: .asciiz "cos(x) ="
# pic: .double 3.1415926535
two_pi: .double 6.283185307179586
one:    .double 1.0
result:    .double 1.0
zero:   .double 0.0
delta:  .double 0.0000001
.text

# taking input in f12 double percision 

li $v0,4
la $a0,number
syscall

li $v0,7
syscall
mov.d $f12,$f0

jal cos  # function call

li $v0,4
la $a0,result_label
syscall

li $v0,3
mov.d $f12,$f0
syscall

# Exit program
li $v0,10
syscall

cos:    # function lable

addi $sp, $sp, -8    # creating stack for 2 values 1 return address & 1 for result 
sw $ra, 0($sp)

l.d $f2,two_pi     # stroing 2pie value in f2 

l.d $f4, zero   # storing the 0 value in f4

# Normalize x to [0, 2π]

# numeralization_high      x>2π

loopxless2Π:            # loop for number greater the 2pie
c.le.d $f12,$f2        # compare number x less then 2pie 
bc1t loopgreaterzero           # #branch on coprocessor1 true go to branch --> loop<zero

sub.d $f12,$f12,$f2
j loopxless2Π

loopgreaterzero :               ## loop for number less then 0
c.le.d   $f4,$f12            # compare number x greater then 2pie
bc1t  series_start          # # #branch on coprocessor1 true go to branch --> series_start

add.d $f12,$f12,$f2
j loopgreaterzero


series_start:       # calculation assigning values to register 
l.d $f6 , one          # term = 1.0
l.d $f8 , result       # result 1 bcz we need to multiply it 
li $t0,1               # k =1 

series_loop:              # loop logic

#    term *= - (x * x) / ((2 * k - 1) * (2 * k))

# part_1     - (x * x) / ((2 * k - 1) * (2 * k))

#a. (x * x)
mul.d $f10,$f12,$f12  # storing result of x^2 in f10

#b. (2 * k - 1)
mul $t1,$t0,2         # storing the value in t1 register 
addi $t1,$t1,-1

#c. (2 * k)
li $t2,1
mul $t2,$t2,$t0       #storing value in t2

#converting to double 
mtc1 $t1,$f14       # moving the interger b part to 14 
cvt.d.w $f14,$f14     # Convert to Double from Word to f14


#converting to double 
mtc1 $t2,$f16       # moving the interger b part to 14 
cvt.d.w $f16,$f16     # Convert to Double from Word to f14

# multiply -> (2 * k - 1) * (2 * k)   ---> b*c
mul.d $f14,$f14,$f16

# fraction = x^2 / denominator
div.d $f10, $f10, $f14   #(x * x) / ((2 * k - 1) * (2 * k))

#negate
neg.d $f10,$f10

# term = term * fraction
mul.d $f6,$f6,$f10  ## part_2 *= - (x * x) / ((2 * k - 1) * (2 * k))

# adding result 
add.d $f8,$f8,$f6 #result += term

#condition 
abs.d $f18,$f6  #  while abs(term) > delta:
l.d $f20,delta

c.lt.d $f18,$f20
bc1t done

addi $t0,$t0,1             # k +1
j series_loop         # go back to loop start

done:
mov.d $f0,$f8  # result returning to f0

#restoring return address 
lw $ra,0($sp)
addi $sp,$sp,8

jr $ra




# Enter value of x (in radians): 10.2
# cos(x) =0.7357838929899807
# -- program is finished running --













