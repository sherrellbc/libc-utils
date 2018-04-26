LIBC_LOCALDIR:=$(dir $(lastword $(MAKEFILE_LIST)))

#CC      = gcc -std=c99
#CFLAGS  ?= -m32 -ffreestanding -nostartfiles -nostdlib -Wall -Wextra -Werror -Iinclude/
#LDFLAGS ?= -nostdlib

# Define build objects, include architecture-specific ones
LIBC_OBJS =\
    $(LIBC_LOCALDIR)/string/strncmp.o \
    $(LIBC_LOCALDIR)/string/strncpy.o \
    $(LIBC_LOCALDIR)/string/strlen.o \
    $(LIBC_LOCALDIR)/string/memcmp.o \
    $(LIBC_LOCALDIR)/string/memcpy.o \
    $(LIBC_LOCALDIR)/string/memmove.o \
    $(LIBC_LOCALDIR)/string/memset.o \
    $(LIBC_LOCALDIR)/string/strrev.o \
    $(LIBC_LOCALDIR)/stdlib/abort.o  \
    $(LIBC_LOCALDIR)/stdlib/itoa.o  \
    $(LIBC_LOCALDIR)/stdio/putchar.o \
    $(LIBC_LOCALDIR)/stdio/puts.o \
    $(LIBC_LOCALDIR)/stdio/snprintf.o \

LIB_OBJS += $(LIBC_OBJS) $(addsuffix .d, $(basename $(LIBC_OBJS))) $(LIBC_LOCALDIR)/libc-utils.a

libc_prebuild:
	@echo "\nBuilding libc"

$(LIBC_OBJS):
	$(CC) -m32 $(CFLAGS) $(LDFLAGS) $(basename $@).c -c -o $@

libc-utils: libc_prebuild $(LIBC_OBJS)
	$(AR) rcs $(LIBC_LOCALDIR)/libc.a $(LIBC_OBJS)
