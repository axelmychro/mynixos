# shellcheck shell=bash

rm() {
  [[ $EUID -ne 0 ]] && {
    command rm "$@"
    return
  }
  local recursive=false
  local no_preserve_root=false
  local targets=()

  for arg in "$@"; do
    case "$arg" in
      -*)
        [[ $arg == *r* ]] && recursive=true
        [[ $arg == "--no-preserve-root" ]] && no_preserve_root=true
        ;;
      *)
        targets+=("$arg")
        ;;
    esac
  done

  for t in "${targets[@]}"; do
    [[ $t == "/" ]] && {
      if $recursive && $no_preserve_root; then
        echo "idiot."
        return 1
      fi
    }
  done

  command rm "$@"
}
