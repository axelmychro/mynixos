my() {
  case "$1" in
    ""|help|-h|--help)
      cat <<'EOF'
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
      git add /etc/nixos \
        && sudo nixos-rebuild switch --flake /etc/nixos#mychro \
        && reboot
      ;;
    drun)
      sudo nixos-rebuild dry-run --flake /etc/nixos#mychro
      ;;
    test)
      git add /etc/nixos \
        && sudo nixos-rebuild test --flake /etc/nixos#mychro
      ;;
    undo)
      sudo nixos-rebuild switch --rollback && reboot
      ;;
    update)
      git add /etc/nixos \
        && nix flake update --extra-experimental-features nix-command \
        && sudo nixos-rebuild switch --flake /etc/nixos#mychro \
        && reboot
      ;;
    look)
      fd -t f /etc/nixos /etc/nixos -E flake.lock -E result \
        -x sh -c 'echo "--- {} ---"; bat --style=plain --paging=never "{}"'
      ;;
    *)
      echo "my: $1: command not found"
      return 1
      ;;
  esac
}

rm() {
  for arg in "$@"; do
    [[ "$arg" == "/" ]] && { echo "idiot."; return 1; }
  done
  command rm "$@"
}

mcd() {
  [[ -z "$1" ]] && return 1
  mkdir -p -- "$1" && cd -- "$1"
}

eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/catppuccin_frappe.omp.jsonc)"

[[ $- == *i* ]] && clear
[[ $SHLVL -eq 1 ]] && fastfetch
