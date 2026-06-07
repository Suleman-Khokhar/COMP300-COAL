.data
date: .word 20040229   # example input

.text

main:

isValidDate:
    # --- Extract year ---
    li   $t0, 10000
    div  $a0, $t0
    mflo $t1          # t1 = year

    # --- Extract month ---
    li   $t0, 100
    div  $a0, $t0
    mflo $t2          # t2 = yyyymm

    li   $t0, 100
    div  $t2, $t0
    mfhi $t2          # t2 = month

    # --- Extract day ---
    li   $t0, 100
    div  $a0, $t0
    mfhi $t3          # t3 = day

    # --- Check month (1–12) ---
    li   $t0, 1
    blt  $t2, $t0, invalid

    li   $t0, 12
    bgt  $t2, $t0, invalid

    # --- Determine max days ---
    li   $t4, 31      # default = 31

    # Check for months with 30 days
    li   $t0, 4
    beq  $t2, $t0, set30
    li   $t0, 6
    beq  $t2, $t0, set30
    li   $t0, 9
    beq  $t2, $t0, set30
    li   $t0, 11
    beq  $t2, $t0, set30

    # Check February
    li   $t0, 2
    beq  $t2, $t0, february
    j    check_day

set30:
    li   $t4, 30
    j    check_day

# --- February logic ---
february:
    # Check leap year
    # if (year % 400 == 0) → leap
    li   $t0, 400
    div  $t1, $t0
    mfhi $t5
    beq  $t5, $zero, leap

    # if (year % 4 == 0 AND year % 100 != 0)
    li   $t0, 4
    div  $t1, $t0
    mfhi $t5
    bne  $t5, $zero, not_leap

    li   $t0, 100
    div  $t1, $t0
    mfhi $t5
    beq  $t5, $zero, not_leap

leap:
    li   $t4, 29
    j    check_day

not_leap:
    li   $t4, 28

# --- Check day range ---
check_day:
    li   $t0, 1
    blt  $t3, $t0, invalid

    bgt  $t3, $t4, invalid

    li   $v0, 1      # valid
    jr   $ra

invalid:
    li   $v0, 0      # invalid
    jr   $ra