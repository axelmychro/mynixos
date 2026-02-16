# shellcheck shell=bash

mcd() {
  [[ -z "$1" ]] && return 1
  mkdir -p -- "$1" && cd -- "$1" || return
}
