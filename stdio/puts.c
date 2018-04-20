#include <stdio.h>


int puts(const char *str)
{
    return port_puts(str);
}
