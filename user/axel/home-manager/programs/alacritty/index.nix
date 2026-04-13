_: {
  programs.alacritty = {
    enable = true;
    settings = {
      general.live_config_reload = false;
      window.padding = {
        x = 2;
        y = 2;
      };
      font = {
        normal.family = "GeistMono Nerd Font";
        size = 12;
      };
      cursor = {
        style = {
          shape = "Underline";
          blinking = "On";
        };
      };
      mouse.hide_when_typing = true;
    };
    theme = "catppuccin_macchiato";
  };
}
