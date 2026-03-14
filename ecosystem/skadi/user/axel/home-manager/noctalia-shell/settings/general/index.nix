_: {
  home.file.".face".source = ../../../../assets/face.jpg;
  programs.noctalia-shell.settings.general = {
    telemetryEnabled = false;
    language = "en";
    avatarImage = "/home/axel/.face";
    dimmerOpacity = 0.2;

    scaleRatio = 1;
    radiusRatio = 0.25;
    iRadiusRatio = 0.25;
    boxRadiusRatio = 1;

    showScreenCorners = false;
    forceBlackScreenCorners = false;
    screenRadiusRatio = 1;

    animationSpeed = 1;
    animationDisabled = false;

    enableBlurBehind = true;
    enableShadows = true;
    shadowDirection = "bottom_right";
    shadowOffsetX = 3;
    shadowOffsetY = 2;

    allowPanelsOnScreenWithoutBar = true;
    showChangelogOnStartup = true;

    autoStartAuth = false;
    allowPasswordWithFprintd = false;

    passwordChars = true;

    reverseScroll = false;
  };
  imports = [
    ./keybinds.nix
    ./lockscreen.nix
  ];
}
