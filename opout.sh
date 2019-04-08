#!/bin/sh

# opout.sh
#
# assemble nasm source file into object file
# dump the .text section into a temp file 
# hexdump the opcodes into shellcode

nasm -f elf64 $1 -o tmp.out
objcopy -O binary --only-section=.text -I elf64-x86-64 tmp.out Opcodes
hexdump -v -e '"\\""x" 1/1 "%02x" ""' Opcodes
