#include <unistd.h>
#include <linux/prctl.h>
#include <sys/wait.h>

int main()
{
//    0x080486d6 <+14>:    call   0x8048550 <fork@plt>

//    0x080486db <+19>:    mov    DWORD PTR [esp+0xac],eax; PID
//    0x080486e2 <+26>:    lea    ebx,[esp+0x20]; shellcode_buffer
//    0x080486e6 <+30>:    mov    eax,0x0
//    0x080486eb <+35>:    mov    edx,0x20
//    0x080486f0 <+40>:    mov    edi,ebx; shellcode_buffer
//    0x080486f2 <+42>:    mov    ecx,edx
//    0x080486f4 <+44>:    rep stos DWORD PTR es:[edi],eax; bzero
    char    shellcode_buffer[144] = {0}; // esp+0x20
    int     pid = fork(); // esp+0xac

//    0x080486f6 <+46>:    mov    DWORD PTR [esp+0xa8],0x0; int status = 0
//    0x08048701 <+57>:    mov    DWORD PTR [esp+0x1c],0x0; int num2 = 0
    int     status = 0;
    int     num2 = 0;

//    0x08048709 <+65>:    cmp    DWORD PTR [esp+0xac],0x0; pid == 0 ?
//    0x08048711 <+73>:    jne    0x8048769 <main+161>; if pid != 0 jmp 161 (process parent)
    if (pid != 0)
    {
        // 0x08048713 <+75>:    mov    DWORD PTR [esp+0x4],0x1
        // 0x0804871b <+83>:    mov    DWORD PTR [esp],0x1
        // 0x08048722 <+90>:    call   0x8048540 <prctl@plt>; prctl(1, 1);
        prctl(1, 1);
        // 0x08048727 <+95>:    mov    DWORD PTR [esp+0xc],0x0
        // 0x0804872f <+103>:   mov    DWORD PTR [esp+0x8],0x0
        // 0x08048737 <+111>:   mov    DWORD PTR [esp+0x4],0x0
        // 0x0804873f <+119>:   mov    DWORD PTR [esp],0x0
        // 0x08048746 <+126>:   call   0x8048570 <ptrace@plt>; ptrace(0, 0, 0, 0);
        ptrace(0, 0, 0, 0);
        // 0x0804874b <+131>:   mov    DWORD PTR [esp],0x8048903; "Give me some shellcode, k"
        // 0x08048752 <+138>:   call   0x8048500 <puts@plt>
        puts("Give me some shellcode, k");
        // 0x08048757 <+143>:   lea    eax,[esp+0x20]
        // 0x0804875b <+147>:   mov    DWORD PTR [esp],eax
        // 0x0804875e <+150>:   call   0x80484b0 <gets@plt>; gets(shellcode_buffer)
        // 0x08048763 <+155>:   jmp    0x804881a <main+338>
        gets(shellcode_buffer);
    }
    // 0x08048769 <+161>:   lea    eax,[esp+0x1c]; status = eax
    // 0x0804876d <+165>:   mov    DWORD PTR [esp],eax; eax = arg 1
    // 0x08048770 <+168>:   call   0x80484f0 <wait@plt>
    // 0x08048775 <+173>:   mov    eax,DWORD PTR [esp+0x1c]
    // 0x08048779 <+177>:   mov    DWORD PTR [esp+0xa0],eax; esp+0xa0 = = wait(0)
    // 0x08048780 <+184>:   mov    eax,DWORD PTR [esp+0xa0]
    // 0x08048787 <+191>:   and    eax,0x7f; WIFSIGNALED
    // 0x0804878a <+194>:   test   eax,eax; 
    while (status != 11)
    {
        status = wait(status);
        if ((status & WIFSIGNALED))
        {
    
            // 0x0804878e <+198>:   mov    eax,DWORD PTR [esp+0x1c]; status = eax
            // 0x08048792 <+202>:   mov    DWORD PTR [esp+0xa4],eax; esp+0xa4 = eax (status)
            // 0x08048799 <+209>:   mov    eax,DWORD PTR [esp+0xa4]; eax = status
            // 0x080487a0 <+216>:   and    eax,0x7f; eax & 0x7f
            // 0x080487a3 <+219>:   add    eax,0x1; eax + 1
            // 0x080487a6 <+222>:   sar    al,1; eax >> 1
            // 0x080487a8 <+224>:   test   al,al; test & test 
            // 0x080487aa <+226>:   jle    0x80487ba <main+242>; +/* Nonzero if STATUS indicates termination by a signal.  */
            //                                                 ; + ((status & 0x7f) + 1) >> 1) > 0; WIFSIGNALED
            if ((((status & 0x7f) + 1) >> 1) <= 0)
            {
                // 0x080487ba <+242>:   mov    DWORD PTR [esp+0xc],0x0; num2 = 0;
                // 0x080487c2 <+250>:   mov    DWORD PTR [esp+0x8],0x2c; esp+0x8 = 48
                // 0x080487ca <+258>:   mov    eax,DWORD PTR [esp+0xac]; pid = eax
                // 0x080487d1 <+265>:   mov    DWORD PTR [esp+0x4],eax; eax = pid 
                // 0x080487d5 <+269>:   mov    DWORD PTR [esp],0x3; esp = 3
                // 0x080487dc <+276>:   call   0x8048570 <ptrace@plt>; ptrace(3, pid, 48, 0);
                status = ptrace(3, pid, 48, 0);
            } 
            puts("child is exiting...");
            
        }
        // 0x080487ac <+228>:   mov    DWORD PTR [esp],0x804891d; "child is exiting..."
        // 0x080487b3 <+235>:   call   0x8048500 <puts@plt>
        // 0x080487b8 <+240>:   jmp    0x804881a <main+338>
    }
    
    return (0);
}