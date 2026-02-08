rm() {
  if [[ "$*" == *"-rf /"* ]]; then
    echo "idiot"
  else
    command rm "$@"
  fi
}

mcd() {
  mkdir -p "$1" && cd "$1"
}

eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/catppuccin_frappe.omp.jsonc)"
clear -x
fastfetch
