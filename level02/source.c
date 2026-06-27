#include <stdio.h>
#include <string.h>

int main()
{
    char username[12] = {0}; // 0x70
    char pass_file_text[5] = {0}; // 0xa0
    char password[12] = {0}; // 0x110
    int fd_pass_file = 0; // rbp-0x8
    int level3_pass_len = 0; // rbp-0xc

    fd_pass_file = fopen("/home/users/level03/.pass", "r");
    if (fd_pass_file == 0)
    {
        fwrite("ERROR: failed to open password file\n", 1, 24, stderr);
        exit(1);
    }

    level3_pass_len = fread(pass_file_text, 1, 29, fd_pass_file);

    int var = strcspn(pass_file_text, "\n");

    pass_file_text[var] = 0;
    if (var != 29)
    {
        fwrite("ERROR: failed to read password file\n", 1, 24 ,stderr);
        exit(1);
    }

    fclose(fd_pass_file);
    puts("===== [ Secure Access System v1.0 ] =====");
    puts("/***************************************\\");
    puts("| You must login to access this system. |");
    puts("/***************************************\\");
    printf("--[ Username: ");

    fgets(username, 100, stdin);

    var = strcspn(username, "\n");
    username[var] = 0;

    printf("--[ Password: ");
    fgets(password, 100, stdin);
    int res = strcspn(password, "\n");
    password[res] = 0;
    puts("***************************************");

    if (strncmp(password, pass_file_text, 41) == 0)
    {
        printf("Greetings, %s!\n", username);
        system("/bin/sh");
    }
    printf(username);
    puts(" does not have access!");
    exit(1);
}