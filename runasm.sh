#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "usage: ./runasm path/to/file.s"
  exit 1
fi

SRC="$1"
OBJ="${SRC%.s}.o"
BIN="${SRC%.s}.out"

as -32 "$SRC" -o "$OBJ"
ld -m elf_i386 "$OBJ" -o "$BIN"

./"$BIN"
