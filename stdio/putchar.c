#include <stdio.h>

char putchar(char c)
{
    return PORT_PUTCHAR(c);
}
