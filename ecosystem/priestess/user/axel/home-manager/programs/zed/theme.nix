_: {
  programs.zed-editor = {
    extensions = [
      "catppuccin"
      "catppuccin-icons"
    ];
    userSettings = {
      icon_theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Frappé";
      };
      theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Frappé";
      };
    };
  };
}
