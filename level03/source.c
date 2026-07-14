#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void    decrypt(int nb)
{
    char buff[17] = "Q}|u`sfg~sf{}|a3";
    int size_len = 0;
    int i = 0;

    size_len = strlen(buff);
    while (size_len > i)
    {
        // <+103>:	lea    eax,[ebp-0x1d]; buff
        // <+106>:	add    eax,DWORD PTR [ebp-0x28]; add 0
        // <+109>:	movzx  eax,BYTE PTR [eax];
        // <+112>:	mov    edx,eax
        // <+114>:	mov    eax,DWORD PTR [ebp+0x8]; param1
        // <+117>:	xor    eax,edx
        // <+119>:	mov    edx,eax
        buff[i] = nb ^ buff[i];
        i++;
    }
    if (!(strncmp(buff, "Congratulations!", 17)))
    {
        puts("\nInvalid Password");
        return ;
    }
    system("/bin/sh");
}

void test(int password, int num)
{
    num = num - password;

    switch( num )
    {
        case 0:
            decrypt(num);
            break;
        case 1:
            decrypt(num);
            break;
        case 2:
            decrypt(num);
            break;
        case 3:
            decrypt(num);
            break;
        case 4:
            decrypt(num);
            break;
        case 5:
            decrypt(num);
            break;
        case 6:
            decrypt(num);
            break;
        case 7:
            decrypt(num);
            break;
        case 8:
            decrypt(num);
            break;
        case 9:
            decrypt(num);
            break;
        case 10:
            decrypt(num);
            break;
        case 11:
            decrypt(num);
            break;
        case 12:
            decrypt(num);
            break;
        case 13:
            decrypt(num);
            break;
        case 14:
            decrypt(num);
            break;
        case 15:
            decrypt(num);
            break;
        case 16:
            decrypt(num);
            break;
        case 17:
            decrypt(num);
            break;
        case 18:
            decrypt(num);
            break;
        case 19:
            decrypt(num);
            break;
        case 20:
            decrypt(num);
            break;
        case 21:
            decrypt(num);
            break;
    }
    decrypt(rand());
}

int main()
{
    int password;
    srand(time(0));
    puts("***********************************");
    puts("*\t\tlevel03\t\t**");
    puts("***********************************");
    puts("Password:");
    scanf("%d", password);
    test(password, 322424845);
}