.data
birthDate:  .word 20040409    
currentDate:.word 20240424     

resultMsg:  .asciiz "Age in days: "

.text
.globl main

main:
    # Load inputs
    lw   $a0, birthDate
    lw   $a1, currentDate

    jal  ageInDays

    # Print result message
    li   $v0, 4
    la   $a0, resultMsg
    syscall

    # Print result (days)
    move $a0, $v0
    li   $v0, 1
    syscall

    # Exit
    li   $v0, 10
    syscall


# -------- FUNCTION --------
ageInDays:

    # -------- Extract birth date --------
    li   $t0, 10000
    div  $a0, $t0
    mflo $t1          # birth year

    li   $t0, 100
    div  $a0, $t0
    mflo $t2
    li   $t0, 100
    div  $t2, $t0
    mfhi $t2          # birth month

    li   $t0, 100
    div  $a0, $t0
    mfhi $t3          # birth day

    # -------- Extract current date --------
    li   $t0, 10000
    div  $a1, $t0
    mflo $t4          # current year

    li   $t0, 100
    div  $a1, $t0
    mflo $t5
    li   $t0, 100
    div  $t5, $t0
    mfhi $t5          # current month

    li   $t0, 100
    div  $a1, $t0
    mfhi $t6          # current day

    li   $t7, 0       # days counter

# -------- LOOP --------
loop:
    # Compare dates
    beq  $t1, $t4, check_month
    blt  $t1, $t4, continue
    j    end

check_month:
    beq  $t2, $t5, check_day
    blt  $t2, $t5, continue
    j    end

check_day:
    beq  $t3, $t6, end
    blt  $t3, $t6, continue
    j    end

continue:
    addi $t7, $t7, 1   # days++

    # Default = 31
    li   $t8, 31

    # Months with 30 days
    li   $t0, 4
    beq  $t2, $t0, set30
    li   $t0, 6
    beq  $t2, $t0, set30
    li   $t0, 9
    beq  $t2, $t0, set30
    li   $t0, 11
    beq  $t2, $t0, set30

    # February
    li   $t0, 2
    beq  $t2, $t0, feb
    j    inc_day

set30:
    li   $t8, 30
    j    inc_day

feb:
    # Leap year check
    li   $t0, 400
    div  $t1, $t0
    mfhi $t9
    beq  $t9, $zero, leap

    li   $t0, 4
    div  $t1, $t0
    mfhi $t9
    bne  $t9, $zero, not_leap

    li   $t0, 100
    div  $t1, $t0
    mfhi $t9
    beq  $t9, $zero, not_leap

leap:
    li   $t8, 29
    j    inc_day

not_leap:
    li   $t8, 28

# Increment date
inc_day:
    addi $t3, $t3, 1
    ble  $t3, $t8, loop

    li   $t3, 1
    addi $t2, $t2, 1

    li   $t0, 12
    ble  $t2, $t0, loop

    li   $t2, 1
    addi $t1, $t1, 1

    j    loop

end:
    move $v0, $t7
    jr   $ra