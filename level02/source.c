#include <stdio.h>

int main()
{
    char buffer[12] = {0};
    char pass_file_text[5] = {0};
    char buffer3[12] = {0};

    int fd_pass_file = 0; // rbp-0x8
    int level3_pass_len = 0; // rbp-0xc

    fd_pass_file = fopen("/home/users/level03/.pass", "r");
    if (fd_pass_file == 0)
    {
        fwrite("ERROR: failed to open password file\n", 24, stderr);
        exit(1);
    }

    fread(pass_file_text, 1, 29, fd_pass_file);

}