; hello64.asm - Windows x64 MessageBox example

default rel                     ; Required for 64-bit NASM on Windows

extern MessageBoxA
extern ExitProcess
global main

section .data
    msg    db "Hello from 64-bit Assembly!", 0
    title  db "Win64 Message", 0

section .text
main:
    sub rsp, 40                ; shadow space (Windows x64 calling convention)

    ; Call MessageBoxA(NULL, msg, title, MB_OK)
    mov rcx, 0                 ; hWnd
    mov rdx, msg               ; LPCTSTR lpText
    mov r8, title              ; LPCTSTR lpCaption
    mov r9, 0                  ; uType = MB_OK
    call MessageBoxA

    ; Call ExitProcess(0)
    mov ecx, 0                 ; exit code
    call ExitProcess
