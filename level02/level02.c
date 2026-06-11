

int main()
{
    rbp-0x114 = 1;
    rbp-0x120 = 140737488348856;

    char buffer1[11] = {0};
    char buffer2[5] = {0};
    char buffer3[11] = {0};


    if (!fopen("/home/user/level03", "r"))
    {
        fwrite("ERROR: failed to open password file\n", 24, stderr);
        exit(1);
    }

    char buffer_rbp_0xa0[];
    

}