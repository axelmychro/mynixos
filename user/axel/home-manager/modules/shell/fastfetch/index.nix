_: {
  programs.fastfetch.enable = true;
  xdg.configFile = {
    "fastfetch" = {
      source = ./config;
      recursive = true;
    };
  };
}
