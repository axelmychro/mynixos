_: {
  programs.sway = {
    enable = true;
    xwayland.enable = true;
    extraOptions = [
      "--verbose"
      "--debug"
      "--unsupported-gpu"
    ];
  };
}
