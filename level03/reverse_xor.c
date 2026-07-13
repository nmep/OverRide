#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int main(void)
{

    int i = 0;
    int num = 0;
    char str[17] = {0};

    while (num <= 21)
    {
        i = 0;
        strcpy(str, "Q}|u`sfg~sf{}|a3");
        while (str[i] != 0)
        {
            str[i] = str[i] ^ num;
            i++;
        }
        printf("str n* %d = [%s]\n", num, str);
        num++;
    }
}
