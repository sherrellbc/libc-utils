#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdint.h>

int snprintf(char *buf, size_t size, const char *format, ...)
{
    int ret; 

    va_list arg;
    va_start(arg, format);
    ret = vsnprintf(buf, size, format, arg);
    va_end(arg);

    return ret; 
}
