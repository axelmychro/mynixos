_: {
  programs.zed-editor = {
    extensions = [
      "nvim-nightfox"
      "bearded-icon-theme"
    ];
    userSettings = {
      icon_theme = {
        mode = "system";
        light = "Bearded Icon Themeicon";
        dark = "Bearded Icon Theme";
      };
      theme = {
        mode = "system";
        light = "Nordfox - opaque";
        dark = "Nordfox - opaque";
      };
    };
  };
}
