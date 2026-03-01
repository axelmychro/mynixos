_: {
  programs.ghostty = {
    enable = true;

    themes = {
      catppuccin-frappe = {
        background = "303446";
        cursor-color = "f2d5cf";
        cursor-text = "232634";
        foreground = "c6d0f5";
        palette = [
          "0=#51576d"
          "1=#e78284"
          "2=#a6d189"
          "3=#e5c890"
          "4=#8caaee"
          "5=#f4b8e4"
          "6=#81c8be"
          "7=#a5adce"
          "8=#626880"
          "9=#e78284"
          "10=#a6d189"
          "11=#e5c890"
          "12=#8caaee"
          "13=#f4b8e4"
          "14=#81c8be"
          "15=#b5bfe2"
        ];
        selection-background = "44495d";
        selection-foreground = "c6d0f5";
        split-divider-color = "414559";
      };
    };
    settings = {
      theme = "catppuccin-frappe";

      font-family = "FiraCode Nerd Font";
      font-size = 16;
      cursor-style = "underline";
      shell-integration-features = "no-cursor";
      mouse-hide-while-typing = true;
      mouse-scroll-multiplier = 3;

      title = "PRTS";
      window-decoration = "auto";
      window-height = 32;
      window-width = 128;
      window-save-state = "never";
    };
  };
}
