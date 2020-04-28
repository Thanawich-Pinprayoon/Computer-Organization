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

    @.balign 4
    @lr_bu_2: .word 0
    
.text
    GCD_vals:
        @R1 => A   ,   R2 => B
        CMP R1,#0 @if A ==0
        BEQ AequalZero
        CMP R2,#0 @ if B == 0
        BEQ BequalZero

        @Normal State
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
    AequalZero: @if A == 0
        MOV R1,R2
        B end
    BequalZero: @if B == 0
        MOV R2,R1
        B end
    end:
        @MOV R0,R1
        BX LR

.global main
.func main

main:
    @Save Link register
    LDR R1, addr_lr_bu
    STR lr,[R1] @ R1 <= LR

    @print msg ask for Num 1
    LDR R0, addr_getA
    BL printf

    @get num1 , R0 = type, R1 = A
    LDR R0, addr_type_input
    LDR R1, addr_A
    BL scanf

    @print msg ask for Num 2
    LDR R0, addr_getB
    BL printf

    @get num 2, R0 = type, R1 = B
    LDR R0, addr_type_input
    LDR R1, addr_B
    BL scanf

    @prepare for calling function
    @R1 = A, R2 = B
    LDR R1, addr_A
    LDR R1,[R1]

    LDR R2, addr_B
    LDR R2,[R2]

    BL GCD_vals
    MOV R3,R1

    @Prepare to print A, B
    LDR R0, addr_result
    LDR R1, addr_A
    LDR R1, [R1]
    LDR R2, addr_B
    LDR R2,[R2]
    @R3 is loaded at line 82
    BL printf

    @Restore link register
    LDR lr, addr_lr_bu
    LDR lr, [lr]
    BX lr

addr_A: .word A
addr_B: .word B
addr_getA: .word getA
addr_getB: .word getB
addr_type_input : .word type_input
addr_GCD: .word GCD
addr_result : .word result
addr_lr_bu: .word lr_bu

.global printf
.global scanf