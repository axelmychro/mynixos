_: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      if status is-interactive
        clear -x
      end
      if test "$SHLVL" -le 2
        fastfetch
      end
    '';
  };
  home.shell.enableFishIntegration = true;

  imports = [
    ./abbrs.nix
    ./aliases.nix
    ./functions.nix
  ];
}
