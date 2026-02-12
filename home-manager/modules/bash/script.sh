#!/usr/bin/env bash

rm() {
  for arg in "$@"; do
    [[ "$arg" == "/" ]] && {
      echo "idiot."
      return 1
    }
  done
  command rm "$@"
}

mcd() {
  [[ -z "$1" ]] && return 1
  mkdir -p -- "$1" && cd -- "$1" || return
}

eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/config.jsonc)"

[[ $- == *i* ]] && clear
[[ $SHLVL -eq 1 ]] && fastfetch
