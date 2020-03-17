.data
    .balign 4
    getA: .asciz "Input num1 : "

    .balign 4 
    getB: .asciz "Input num2 : "

    .balign 4
    A: .word 0

    .balign 4
    B: .word 0

    .balign 4
    GCD: .word 0

    .balign 4
    result: .asciz "GCD of %d and %d is %d"

    .balign 4
    type_input: .asciz "%d"

    .balign 4
    lr_bu: .word 0

.text

    GCD_vals:
        @R1 => A   ,   R2 => B
        CMP R1,R2
        BGT AgtB
        BLT AltB
        BEQ end
    AgtB:
        SUB R1,R1,R2
        B GCD_vals
    AltB:
        SUB R2,R2,R1
        B GCD_vals
    end:
        BX LR

.global main
.func main

main:
    @Save Link register
    LDR R5, addr_lr_bu
    STR lr,[R5] @ R5 <= LR

    @print msg ask for Num 1
    LDR R0, =getA
    BL printf

    @get num1 , R0 = type, R1 = A
    LDR R0,=type_input
    LDR R1,=A
    BL scanf

    @print msg ask for Num 2
    LDR R0, getB
    BL printf

    @get num 2, R0 = type, R1 = B
    LDR R0, =type_input
    LDR R1, =B
    BL scanf

    @prepare for calling function
    @R1 = A, R2 = B
    LDR R1, =A
    LDR R1,[R1]

    LDR R2, =B
    LDR R2,[R2]

    BL GCD_vals
    MOV R3,R1

    @Prepare to print A, B
    LDR R0, =result
    LDR R1, =A
    LDR R1, [R1]
    LDR R2, =B
    LDR R2,[R2]
    @R3 is loaded at line 78
    BL printf

    @Restore link register
    LDR lr, addr_lr_bu
    LDR lr, [lr]
    BX lr

.global printf
.global scanf