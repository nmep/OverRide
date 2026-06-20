push   rbp
mov    rbp, rsp
sub    rsp, 0x120
mov    DWORD PTR [rbp-0x114], edi
mov    QWORD PTR [rbp-0x120], rsi

lea    rdx, [rbp-0x70]
mov    eax, 0x0
mov    ecx, 0xc
mov    rdi, rdx
rep stos QWORD PTR [rdi], rax ; char username[12] = {0}

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
lea    rdx, [rbp-0x110]; password
mov    eax, 0x0
mov    ecx, 0xc
mov    rdi, rdx
rep stos QWORD PTR [rdi], rax ; char password[12] = {0}

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
call   0x400720 <fwrite@plt>; fwrite("ERROR: failed to open password file\n", 1, 24, stderr);
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
lea    rax, [rbp-0xa0]; pass_file_text
mov    esi, 0x400bf5; "\n"
mov    rdi, rax; pass_file_text
call   0x4006d0 <strcspn@plt>; 
mov    BYTE PTR [rbp+rax*1-0xa0], 0x0; pass_file_text[rax] = 0;
cmp    DWORD PTR [rbp-0xc], 0x29; level3_pass_len == 29 

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
;        fwrite("ERROR: failed to read password file\n", 24 ,stderr);
;        exit(1);

<main+361>
mov    rax, QWORD PTR [rbp-0x8]
mov    rdi, rax
call   0x4006a0 <fclose@plt>
mov    edi, 0x400c20; "===== [ Secure Access System v1.0 ] ====="
call   0x400680 <puts@plt>
mov    edi, 0x400c50; "/", '*' <repeats 39 times>, "\\"
call   0x400680 <puts@plt>
mov    edi, 0x400c80; "| You must login to access this system. |"
call   0x400680 <puts@plt>
mov    edi, 0x400cb0; "\\", '*' <repeats 38 times>, "/"
call   0x400680 <puts@plt>
mov    eax, 0x400cd9; "--[ Username: "
mov    rdi, rax
mov    eax, 0x0
call   0x4006c0 <printf@plt>; printf("--[ Username: ")

mov    rax, QWORD PTR [rip+0x20087e]        # 0x601248 <stdin@@GLIBC_2.2.5>
mov    rdx, rax
lea    rax, [rbp-0x70]; usename
mov    esi, 0x64; 100
mov    rdi, rax
call   0x4006f0 <fgets@plt>; fgets(username, 100, stdin);
lea    rax, [rbp-0x70]; username
mov    esi, 0x400bf5; "\n"
mov    rdi, rax; username
call   0x4006d0 <strcspn@plt>
mov    BYTE PTR [rbp+rax*1-0x70], 0x0
; var = strcspn(username, "\n");
; username[var] = 0;

mov    eax, 0x400ce8; "--[ Password: "
mov    rdi, rax
mov    eax, 0x0
call   0x4006c0 <printf@plt>; printf("--[ Password: ");
mov    rax, QWORD PTR [rip+0x20083b]        # 0x601248 <stdin@@GLIBC_2.2.5>
mov    rdx, rax
lea    rax, [rbp-0x110]; password buffer
mov    esi, 0x64; 100
mov    rdi, rax
call   0x4006f0 <fgets@plt>; fgets(password, 100, stdin); 
lea    rax, [rbp-0x110]
mov    esi, 0x400bf5; "\n"
mov    rdi, rax
call   0x4006d0 <strcspn@plt>; strcspn(password, "\n")
mov    BYTE PTR [rbp+rax*1-0x110], 0x0; password[rax] = 0;
mov    edi, 0x400cf8
call   0x400680 <puts@plt>
lea    rcx, [rbp-0x110]; password
lea    rax, [rbp-0xa0]; pass_file_text
mov    edx, 0x29; 41
mov    rsi, rcx
mov    rdi, rax
call   0x400670 <strncmp@plt>

test   eax, eax
jne    0x400a96 <main+642>

mov    eax, 0x400d22; "Greetings, %s!\n"
lea    rdx, [rbp-0x70]; username
mov    rsi, rdx
mov    rdi, rax
mov    eax, 0x0
call   0x4006c0 <printf@plt>; printf("Greetings, %s!\n", username);
mov    edi, 0x400d32; /bin/sh
call   0x4006b0 <system@plt>; system("/bin/sh")
mov    eax, 0x0
leave
ret

<main+642>
lea    rax, [rbp-0x70]; username
mov    rdi, rax
mov    eax, 0x0
call   0x4006c0 <printf@plt>; printf(username); /!\ string format
mov    edi, 0x400d3a; " does not have access!"
call   0x400680 <puts@plt>; puts(" does not have access!")
mov    edi, 0x1
call   0x400710 <exit@plt>; exit(1);