_: {
  programs.bash = {
    enable = true;
    initExtra = builtins.readFile ./init.sh;
  };
  shell.enableBashIntegration = true;
}
