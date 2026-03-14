_: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = false;

    themes = {
      nord = {
        background = "3b4252";
        foreground = "d8dee9";
        cursor-color = "e5e9f0";
        cursor-text = "eceff4";
        palette = [
          "0=#434c5e"
          "1=#bf616a"
          "2=#a3be8c"
          "3=#ebcb8b"
          "4=#5e81ac"
          "5=#b48ead"
          "6=#8fbcbb"
          "7=#81a1c1"
          "8=#4c566a"
          "9=#bf616a"
          "10=#a3be8c"
          "11=#ebcb8b"
          "12=#5e81ac"
          "13=#b48ead"
          "14=#8fbcbb"
          "15=#b5bfe2"
        ];
        selection-background = "81a1c1";
        selection-foreground = "d8dee9";
        split-divider-color = "81a1c1";
      };
    };
    settings = {
      shell-integration = "none";
      theme = "nord";

      font-family = "FiraCode Nerd Font";
      font-size = 16;
      cursor-style = "underline";
      shell-integration-features = "no-cursor";
      mouse-hide-while-typing = true;
      mouse-scroll-multiplier = 3;

      title = "catastrophe";
      window-decoration = "none";
      window-height = 24;
      window-width = 80;
      window-save-state = "never";
    };
  };
}
