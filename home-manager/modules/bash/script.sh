#!/usr/bin/env bash

my() {
  case "$1" in
    "" | help | -h | --help)
      cat << 'EOF'
usage: my <command>

commands:
  drun
  test
  switch
  undo
  update
  look
EOF
      ;;
    switch)
      git add /etc/nixos &&
        sudo nixos-rebuild switch --flake /etc/nixos#mychro &&
        reboot
      ;;
    drun)
      sudo nixos-rebuild dry-run --flake /etc/nixos#mychro
      ;;
    test)
      git add /etc/nixos &&
        sudo nixos-rebuild test --flake /etc/nixos#mychro
      ;;
    undo)
      sudo nixos-rebuild switch --rollback && reboot
      ;;
    update)
      git add /etc/nixos &&
        nix flake update --extra-experimental-features nix-command &&
        sudo nixos-rebuild switch --flake /etc/nixos#mychro &&
        reboot
      ;;
    purge)
      echo "my: clean: deleting generations older than 3 days"
      sudo nix-collect-garbage --delete-older-than 3d
      nix-collect-garbage -d

      echo "my: clean: running store gc"
      sudo nix-store --gc

      echo "my: clean: optimising store"
      sudo nix-store --optimise

      echo "my: clean: complete"
      ;;
    overview)
      rm /etc/nixos/overview &&
        fd -t f . /etc/nixos \
          -E flake.lock \
          -E hardware-configuration.nix \
          -E '*.md' \
          -E '*.txt' \
          -E '*.cfg' \
          -E '*.jpg' \
          -E '*.png' |
        while read -r file; do
          printf "\n--- %s ---\n" "$file" >> /etc/nixos/overview
          bat -pp "$file" >> /etc/nixos/overview
        done
      ;;
    *)
      echo "my: $1: command not found"
      return 1
      ;;
  esac
}
_my_complete() {
  local cmds="drun test switch undo update purge overview"
  COMPREPLY=($(compgen -W "$cmds" -- "${COMP_WORDS[1]}"))
}
complete -F _my_complete my

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
