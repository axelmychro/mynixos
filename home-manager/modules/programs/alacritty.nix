_: {
  programs.alacritty = {
    enable = true;
    shellIntegration.enableBashIntegration = false; # let oh-my-posh handle the window title
  };
}
