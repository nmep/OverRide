push   rbp
mov    rbp, rsp
sub    rsp, 0x120
mov    DWORD PTR [rbp-0x114], edi
mov    QWORD PTR [rbp-0x120], rsi

lea    rdx, [rbp-0x70]
mov    eax, 0x0
mov    ecx, 0xc
mov    rdi, rdx
rep stos QWORD PTR [rdi], rax ; char buffer[12] = {0}

mov    rdx, rdi
mov    DWORD PTR [rdx], eax
add    rdx, 0x4
lea    rdx, [rbp-0xa0]
mov    eax, 0x0
mov    ecx, 0x5
mov    rdi, rdx
rep stos QWORD PTR [rdi], rax ; char pass_file_text[5] = {0}

mov    rdx, rdi
mov    BYTE PTR [rdx], al
add    rdx, 0x1
lea    rdx, [rbp-0x110]
mov    eax, 0x0
mov    ecx, 0xc
mov    rdi, rdx
rep stos QWORD PTR [rdi], rax ; char pass_file_text[12] = {0}

mov    rdx, rdi
mov    DWORD PTR [rdx], eax
add    rdx, 0x4
mov    QWORD PTR [rbp-0x8], 0x0; int pass_file_fd = 0
mov    DWORD PTR [rbp-0xc], 0x0; int level3_pass_len = 0
mov    edx, 0x400bb0; "r"
mov    eax, 0x400bb2; "/home/users/level03/.pass"
mov    rsi, rdx; #2nd arg
mov    rdi, rax; #1nd arg
call   0x400700 <fopen@plt>; fopen("/home/users/level03/.pass",  "r"); 
mov    QWORD PTR [rbp-0x8], rax;
cmp    QWORD PTR [rbp-0x8], 0x0; if (rbp-0x8 != 0)

jne    0x4008e6 <main+210>

mov    rax, QWORD PTR [rip+0x200991]        # 0x601250 <stderr@@GLIBC_2.2.5>
mov    rdx, rax
mov    eax, 0x400bd0
mov    rcx, rdx
mov    edx, 0x24
mov    esi, 0x1
mov    rdi, rax
call   0x400720 <fwrite@plt>; fwrite("ERROR: failed to open password file\n",  24,  stderr);
mov    edi, 0x1
call   0x400710 <exit@plt>; exit(1)

<main+210>
lea    rax, [rbp-0xa0]; pass_file_text
mov    rdx, QWORD PTR [rbp-0x8]; fd_pass_file
mov    rcx, rdx; fd_pass_file
mov    edx, 0x29; 29
mov    esi, 0x1
mov    rdi, rax; pass_file_text -> #1 arg
call   0x400690 <fread@plt>; fread(pass_file_text,  1,  29,  fd_pass_file);
mov    DWORD PTR [rbp-0xc], eax; level3_pass_len = fread()
lea    rax, [rbp-0xa0]
mov    esi, 0x400bf5; "\n"
mov    rdi, rax; pass_file_text
call   0x4006d0 <strcspn@plt>
mov    BYTE PTR [rbp+rax*1-0xa0], 0x0
cmp    DWORD PTR [rbp-0xc], 0x29 

je     0x40097d <main+361>

mov    rax, QWORD PTR [rip+0x20091e]        # 0x601250 <stderr@@GLIBC_2.2.5>
mov    rdx, rax
mov    eax, 0x400bf8
mov    rcx, rdx
mov    edx, 0x24
mov    esi, 0x1
mov    rdi, rax
call   0x400720 <fwrite@plt>
mov    rax, QWORD PTR [rip+0x2008fa]        # 0x601250 <stderr@@GLIBC_2.2.5>
mov    rdx, rax
mov    eax, 0x400bf8
mov    rcx, rdx
mov    edx, 0x24
mov    esi, 0x1
mov    rdi, rax
call   0x400720 <fwrite@plt>
mov    edi, 0x1
call   0x400710 <exit@plt>

mov    rax, QWORD PTR [rbp-0x8]
mov    rdi, rax
call   0x4006a0 <fclose@plt>
mov    edi, 0x400c20
call   0x400680 <puts@plt>
mov    edi, 0x400c50
call   0x400680 <puts@plt>
mov    edi, 0x400c80
call   0x400680 <puts@plt>
mov    edi, 0x400cb0
call   0x400680 <puts@plt>
mov    eax, 0x400cd9
mov    rdi, rax
mov    eax, 0x0
call   0x4006c0 <printf@plt>
mov    rax, QWORD PTR [rip+0x20087e]        # 0x601248 <stdin@@GLIBC_2.2.5>
mov    rdx, rax
lea    rax, [rbp-0x70]
mov    esi, 0x64
mov    rdi, rax
call   0x4006f0 <fgets@plt>
lea    rax, [rbp-0x70]
mov    esi, 0x400bf5
mov    rdi, rax
call   0x4006d0 <strcspn@plt>
mov    BYTE PTR [rbp+rax*1-0x70], 0x0
mov    eax, 0x400ce8
mov    rdi, rax
mov    eax, 0x0
call   0x4006c0 <printf@plt>
mov    rax, QWORD PTR [rip+0x20083b]        # 0x601248 <stdin@@GLIBC_2.2.5>
mov    rdx, rax
lea    rax, [rbp-0x110]
mov    esi, 0x64
mov    rdi, rax
call   0x4006f0 <fgets@plt>
lea    rax, [rbp-0x110]
mov    esi, 0x400bf5
mov    rdi, rax
call   0x4006d0 <strcspn@plt>
mov    BYTE PTR [rbp+rax*1-0x110], 0x0
mov    edi, 0x400cf8
call   0x400680 <puts@plt>
lea    rcx, [rbp-0x110]
lea    rax, [rbp-0xa0]
mov    edx, 0x29
mov    rsi, rcx
mov    rdi, rax
call   0x400670 <strncmp@plt>
test   eax, eax
jne    0x400a96 <main+642>
mov    eax, 0x400d22
lea    rdx, [rbp-0x70]
mov    rsi, rdx
mov    rdi, rax
mov    eax, 0x0
call   0x4006c0 <printf@plt>
mov    edi, 0x400d32
call   0x4006b0 <system@plt>
mov    eax, 0x0
leave
ret
lea    rax, [rbp-0x70]
mov    rdi, rax
mov    eax, 0x0
call   0x4006c0 <printf@plt>
mov    edi, 0x400d3a
call   0x400680 <puts@plt>
mov    edi, 0x1
call   0x400710 <exit@plt>

