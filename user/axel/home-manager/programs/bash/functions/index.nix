_: {
  programs.bash.initExtra = ''
    ${builtins.readFile ./my.bash}

    ${builtins.readFile ./cpprun.bash}
    ${builtins.readFile ./crun.bash}
    ${builtins.readFile ./mcd.bash}
    ${builtins.readFile ./rm.bash}
  '';
}
