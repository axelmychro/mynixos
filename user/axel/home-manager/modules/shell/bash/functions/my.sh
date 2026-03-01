# shellcheck shell=bash

my() {
  case "$1" in
    "" | help | -h | --help)
      cat << 'EOF'
usage: my <command>

commands:
  status
  switch
  drun
  test
  undo
  update
  prune
  purge
  overview
EOF
      ;;
    status)
      fd . /etc/nixos -e nix -E flake.lock -E hardware-configuration.nix \
        -x sh -c 'nixfmt "{}" && nix run nixpkgs#deadnix -- --edit "{}" && nix run nixpkgs#statix -- fix "{}"'
      fd . /etc/nixos -e sh -x shfmt -w -s -i 2 -ci -sr {}
      echo "my: status: done"
      ;;
    switch)
      git add /etc/nixos &&
        sudo nixos-rebuild switch --flake /etc/nixos#mychro
      ;;
    drun)
      git add /etc/nixos &&
        sudo nixos-rebuild dry-run --flake /etc/nixos#mychro
      ;;
    test)
      git add /etc/nixos &&
        sudo nixos-rebuild test --flake /etc/nixos#mychro
      ;;
    undo)
      sudo nixos-rebuild switch --rollback
      ;;
    update)
      git add /etc/nixos &&
        nix flake update &&
        sudo nixos-rebuild switch --flake /etc/nixos#mychro
      ;;
    prune)
      echo "my: prune: delete generations older than 3 days"
      sudo nix-collect-garbage --delete-older-than 3d
      nix-collect-garbage -d
      echo "my: prune: collect store garbage"
      sudo nix-store --gc
      echo "my: prune: optimise store"
      sudo nix-store --optimise
      echo "my: prune: done"
      ;;
    purge)
      echo "my: purge: delete previous generation(s)"
      sudo nix-collect-garbage -d
      nix-collect-garbage -d
      echo "my: purge: collect store garbage"
      sudo nix-store --gc
      echo "my: purge: optimise store"
      sudo nix-store --optimise
      echo "my: purge: done"
      ;;
    overview)
      local root="/etc/nixos"
      local out="/etc/nixos/overview.md"
      rm -f "$out"
      {
        echo "# Overview"
        echo
        echo "Generated on: $(date)"
        echo
        fd -t f -e nix -e sh . "$root" \
          -E hardware-configuration.nix -E flake.lock | sort |
          while read -r file; do
            rel_dir=$(dirname "${file#$root/}")
            filename=$(basename "$file")
            ext="${file##*.}"
            lang="nix"
            [[ $ext == "sh" ]] && lang="bash"

            if [[ $rel_dir != "$last_dir" ]]; then
              if [[ $rel_dir == "." ]]; then
                echo "## mynixos"
                echo
              else
                echo "## ./${rel_dir}"
                echo
              fi
              last_dir="$rel_dir"
            fi
            echo "### $filename"
            echo "\`\`\`$lang"
            cat "$file"
            echo ""
            echo '```'
            echo ""
          done
      } > "$out"
      echo "my: overview: created $out"
      ;;
    *)
      echo "my: $1: command not found"
      return 1
      ;;
  esac
}
_my_complete() {
  if [[ $COMP_CWORD -ne 1 ]]; then
    return 0
  fi
  local cmds="status switch test drun undo update prune purge overview"
  mapfile -t COMPREPLY < <(compgen -W "$cmds" -- "$2")
}
complete -F _my_complete my
