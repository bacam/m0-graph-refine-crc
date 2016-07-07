#!/bin/sh

BASE=crc

rm -f \
  "$BASE" \
  "$BASE".elf.symtab \
  "$BASE".elf.txt \
  "$BASE".elf.rodata \
  "$BASE"_C_graph.txt \
  "$BASE"_mc_graph.txt \
  "$BASE"_output.txt \
  "$BASE".sigs \
  StackBounds.txt \
  umm_types.txt \
  target.pyc
