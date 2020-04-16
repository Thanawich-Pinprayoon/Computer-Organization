.data
    .balign 4
intro: .asciz "wiringPi LED blinking\n"
errMsg: .asciz "Setup problem ... Abort!\n"
led0: .int 0
led1: .int 2
led2: .int 3
duration: .int 1000
OUTPUT = 1 @constant
    .text
    .global main
    .extern printf
    .extern wiringPiSetup
    .extern delay
    .extern digitalWrite
    .extern pinMode
main:
    PUSH {ip, lr}
    LDR R0, =intro
    BL printf
    BL wiringPiSetup
    CMP R0, #-1
    BNE init
    LDR R0, =errMsg
    BL printf
    B done
init:
    LDR R0, =led0
    LDR R0, [R0]
    MOV R1, OUTPUT
    BL pinMode
    LDR R0, =led1
    LDR R0, [R0]
    BL pinMode
    LDR R0, =led2
    LDR R0, [R0]
    BL pinMode
    MOV R0, #7
    MOV R1, #0
    BL pinMode
while:
    MOV R4, #0
forLoop:
    CMP R4, #8
    BGE while

    LDR R0, =led0
    LDR R0, [R0]
    AND R1, R4, #4
    LSR R1, R1, #2
    BL digitalWrite
    LDR R0, =led1
    LDR R0, [R0]
    AND R1, R4, #2
    LSR R1, R1, #1
    BL digitalWrite
    LDR R0, =led2
    LDR R0, [R0]
    AND R1, R4, #1
    BL digitalWrite

    LDR R0, =duration
    LDR R0, [R0]
    BL delay
    ADD R4, R4, #1
    B forLoop
done:
    POP {ip,pc}