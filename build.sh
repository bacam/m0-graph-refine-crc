#!/bin/sh

set -ex

BASE=crc

HOL=~/HOL/decompilation

SEL4=~/sel4/verification
PATH="$SEL4/l4v/tools/c-parser/standalone-parser":"$SEL4/isabelle/bin":"$HOL/bin:$PATH"
GRAPH_REFINE=../graph-refine

arm-none-eabi-gcc -Wall -mthumb -mcpu=cortex-m0 -O1 -nostdlib -nostdinc -ffreestanding "$BASE.c" -o "$BASE"
arm-none-eabi-objdump -d "$BASE" > "$BASE.elf.txt"
arm-none-eabi-objdump -t "$BASE" > "$BASE.elf.symtab"
arm-none-eabi-objdump -z -D -j .rodata "$BASE" > "$BASE.elf.rodata"
c-parser --mmbytes "$BASE.c" > "$BASE.sigs"
$HOL/examples/machine-code/graph/decompile.py "$BASE"
isabelle build -v -d "$SEL4/l4v" -c -d . Export
python "$GRAPH_REFINE/graph-refine.py" . all
