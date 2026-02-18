# shellcheck shell=bash

cpprun() {
  [ -z "$1" ] && {
    echo "usage: cpprun <file.cpp>"
    return 1
  }
  [ ! -f "$1" ] && {
    echo "cpprun: file not found: $1"
    return 1
  }
  [[ $1 != *.cpp ]] && {
    echo "cpprun: only .cpp files allowed"
    return 1
  }
  file="${1%.*}"
  g++ "$1" -Wall -Wextra -std=c++20 -o "$file" && "./$file"
}
