_: {
  programs.zed-editor = {
    extensions = [
      "catppuccin"
      "catppuccin-icons"
    ];
    userSettings = {
      ui_font_size = 20.0;
      ui_font_family = "GeistMono Nerd Font";

      icon_theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Macchiato";
      };
      theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Macchiato";
      };
    };
  };
}
