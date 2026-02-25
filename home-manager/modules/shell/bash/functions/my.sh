# shellcheck shell=bash

ROOT="/etc/nixos"
FLAKES="celcius fahrenheit kelvin"

require_flake() {
  local flake="$1"

  if [[ -z $flake ]]; then
    echo "my: missing configuration"
    echo "usage: my <command> {$FLAKES}"
    return 1
  fi

  case " $FLAKES " in
    *" $flake "*) ;;
    *)
      echo "my: invalid configuration: $flake"
      return 1
      ;;
  esac
}

my() {
  case "$1" in
    "" | help | -h | --help)
      cat << EOF
usage: my <command> [flake]

commands:
  status
  switch
  drun
  test
  undo
  update
  purge
  overview
EOF
      ;;

    status)
      fd . "$ROOT" -e nix -E flake.lock -E hardware-configuration.nix \
        -x sh -c '
          nixfmt "{}" &&
          nix run nixpkgs#deadnix -- --edit "{}" &&
          nix run nixpkgs#statix -- fix "{}"
        '

      fd . "$ROOT" -e sh \
        -x shfmt -w -s -i 2 -ci -sr {}

      echo "my: status: done"
      ;;

    switch)
      local flake="$2"
      require_flake "$flake" || return 1

      git add "$ROOT" &&
        sudo nixos-rebuild switch --flake "$ROOT#$flake" &&
        reboot
      ;;

    drun)
      local flake="$2"
      require_flake "$flake" || return 1

      sudo nixos-rebuild dry-run --flake "$ROOT#$flake"
      ;;

    test)
      local flake="$2"
      require_flake "$flake" || return 1

      git add "$ROOT" &&
        sudo nixos-rebuild test --flake "$ROOT#$flake"
      ;;

    undo)
      sudo nixos-rebuild switch --rollback && reboot
      ;;

    update)
      local flake="$2"
      require_flake "$flake" || return 1

      git add "$ROOT" &&
        nix flake update &&
        sudo nixos-rebuild switch --flake "$ROOT#$flake" &&
        reboot
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
      local root="$ROOT"
      local out="$ROOT/overview.md"

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
              else
                echo "## ./${rel_dir}"
              fi
              echo
              last_dir="$rel_dir"
            fi

            echo "### $filename"
            echo "\`\`\`$lang"
            cat "$file"
            echo
            echo '```'
            echo
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
  local cur
  cur="${COMP_WORDS[COMP_CWORD]}"

  local cmds="status switch drun test undo update purge overview"

  if [[ $COMP_CWORD -eq 1 ]]; then
    mapfile -t COMPREPLY < <(compgen -W "$cmds" -- "$cur")
    return 0
  fi

  case "${COMP_WORDS[1]}" in
    switch | drun | test | update)
      if [[ $COMP_CWORD -eq 2 ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$FLAKES" -- "$cur")
      fi
      ;;
  esac
}
complete -F _my_complete my
