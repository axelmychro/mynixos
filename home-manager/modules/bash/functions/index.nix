_: {
  programs.bash.initExtra = ''
    ${builtins.readFile ./my.sh}

    ${builtins.readFile ./cpprun.sh}
    ${builtins.readFile ./crun.sh}
  '';
}
