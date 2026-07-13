#include <time.h>
#include <stdlib.h>
#include <stdio.h>

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
}

void test(int buffiable, int 0x1337d00d)
{
    int res = 0x1337d00d - buffiable;
    res <<= 2;
    res += 0x80489f0;

    switch( res )
    {
        case 0:
            decrypt(res);
            break;
        case 1:
            decrypt(res);
            break;
        case 2:
            decrypt(res);
            break;
        case 3:
            decrypt(res);
            break;
        case 4:
            decrypt(res);
            break;
        case 5:
            decrypt(res);
            break;
        case 6:
            decrypt(res);
            break;
        case 7:
            decrypt(res);
            break;
        case 8:
            decrypt(res);
            break;
        case 9:
            decrypt(res);
            break;
        case 10:
            decrypt(res);
            break;
        case 11:
            decrypt(res);
            break;
        case 12:
            decrypt(res);
            break;
        case 13:
            decrypt(res);
            break;
        case 14:
            decrypt(res);
            break;
    }
    int rand_res = rand();
    decrypt(rand_res);
}

int main()
{
    int buffiable;
    srand(time(0));
    puts("***********************************");
    puts("*\t\tlevel03\t\t**");
    puts("***********************************");
    puts("Password:");
    scanf("%d", buffiable);
    test(buffiable, 0x1337d00d);


}