# shellcheck shell=bash

crun() {
  [ -z "$1" ] && {
    echo "usage: crun <file.c>"
    return 1
  }
  [ ! -f "$1" ] && {
    echo "crun: file not found: $1"
    return 1
  }
  [[ $1 != *.c ]] && {
    echo "crun: only .c files allowed"
    return 1
  }
  file="${1%.*}"
  gcc "$1" -Wall -Wextra -std=c23 -o "$file" && "./$file"
}
