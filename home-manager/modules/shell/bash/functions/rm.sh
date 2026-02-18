# shellcheck shell=bash

rm() {
  for arg in "$@"; do
    [[ $arg == "/" ]] && {
      echo "idiot."
      return 1
    }
  done
  command rm "$@"
}
