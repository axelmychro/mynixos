_: {
  programs.bash.initExtra = ''
    ${builtins.readFile ./my.sh}

    ${builtins.readFile ./cpprun.sh}
    ${builtins.readFile ./crun.sh}
    ${builtins.readFile ./mcd.sh}
    ${builtins.readFile ./rm.sh}
  '';
}
