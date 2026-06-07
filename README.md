# 🖥️ COMP300 — Computer Organization and Assembly Language

**Forman Christian College (A Chartered University)**
Spring 2026 | BS Computer Science

---

## 📖 About This Repository

This repository contains my homework solutions for **COMP300 — Computer Organization and Assembly Language (COAL)**. All programs are written in **MIPS Assembly Language** and are designed to run on the **MARS (MIPS Assembler and Runtime Simulator)**.

---

## 📁 Repository Structure

```
COMP300-COAL/
│
├── HW1/                        # Implementing Conditions
│   ├── rollno-h1-ex1.asm       # Exercise 1: OR + AND condition
│   ├── rollno-h1-ex2.asm       # Exercise 2: Nested if-else condition
│   └── rollno-h1-ex3.asm       # Exercise 3: Float, char & integer condition
│
├── HW2/                        # Floating Point & Series Expansion
│   └── rollno-h2-ex1.asm       # Exercise 1: Computing cos(x) using Taylor series
│
├── HW3/                        # Integer Arithmetic & Loops
│   ├── rollno-h3-ex1.asm       # Exercise 1: Leap Year checker
│   ├── rollno-h3-ex2.asm       # Exercise 2: Date Validation (yyyymmdd)
│   └── rollno-h3-ex3.asm       # Exercise 3: Age in Days calculator
│
└── HW4/                        # Heap Memory & Arrays
    ├── rollno-h4-ex1.asm       # Exercise 1: getFloatArray (dynamic heap allocation)
    ├── rollno-h4-ex2.asm       # Exercise 2: sortFloatArray (bubble sort)
    └── rollno-h4-ex3.asm       # Exercise 3: printFloatArray
```

---

## 📝 Homework Breakdown

### HW1 — Implementing Conditions
Practice implementing moderately complex conditional logic in MIPS assembly.

| Exercise | Description |
|----------|-------------|
| Ex 1 | Read three integers `x, y, z`; evaluate `(x < 10) OR ((y != 4) AND (z > 2))` |
| Ex 2 | Read three integers `a, b, c`; evaluate nested if-else with multiple conditions |
| Ex 3 | Read a float `u`, char `v`, and integer `w`; conditional logic with mixed types |

---

### HW2 — Computing cos(x)
Compute `cos(x)` for any real value of `x` using the **Taylor series expansion**.

| Exercise | Description |
|----------|-------------|
| Ex 1 | Scale `x` into range `[0, 2π]`, then compute `cos(x)` accurate to 6 decimal places using double-precision floating point |

---

### HW3 — Integer Arithmetic & Loops
Practice MIPS integer arithmetic, modular functions, and counting loops.

| Exercise | Description |
|----------|-------------|
| Ex 1 | `isLeapYear(year)` — returns 1 if leap year, 0 otherwise |
| Ex 2 | `isValidDate(yyyymmdd)` — validates a date including month/day bounds and leap year check |
| Ex 3 | `ageInDays(dob, today)` — returns a person's age as total number of days |

---

### HW4 — Heap Memory & Float Arrays
Learn dynamic memory allocation using the `sbrk` system call in MIPS.

| Exercise | Description |
|----------|-------------|
| Ex 1 | `getFloatArray(n, prompt)` — allocates heap memory for `n` floats, reads values from keyboard |
| Ex 2 | `sortFloatArray(n, addr)` — sorts float array in ascending order by swapping in-place |
| Ex 3 | `printFloatArray(n, addr)` — prints each float value on a new line |

---

## 🛠️ Tools & Environment

| Tool | Purpose |
|------|---------|
| [MARS Simulator](http://courses.missouristate.edu/KenVollmar/MARS/) | Assemble and run MIPS programs |
| MIPS32 ISA | Instruction Set Architecture used |
| Git & GitHub | Version control and hosting |

---

## 📌 Conventions Followed

- ✅ MIPS function calling conventions (`$a0–$a3` for args, `$v0–$v1` for return)
- ✅ Caller-saved vs callee-saved register discipline
- ✅ Stack frame management (`$sp`, `$ra` saved/restored properly)
- ✅ Code commented for clarity
- ✅ Modular functions (no monolithic code)

---

## 👤 Author

**Suleman Khokhar**
BS Computer Science — Forman Christian College
COMP300 Spring 2026

---

> *"First, solve the problem. Then, write the code."* — John Johnson
