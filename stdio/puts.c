#include <stdio.h>


int puts(const char *str)
{
    return PORT_PUTS(str);
}
