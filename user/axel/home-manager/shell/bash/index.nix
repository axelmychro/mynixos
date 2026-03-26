_: {
  home.shell.enableBashIntegration = true;
  programs.bash = {
    enable = true;

    shellAliases = {
      x = "exec bash";
      xx = "exit";
    };
    initExtra = builtins.readFile ./init.bash;
    profileExtra = builtins.readFile ./login.bash;
    logoutExtra = builtins.readFile ./logout.bash;
  };
  imports = [ ./functions/index.nix ];
}
