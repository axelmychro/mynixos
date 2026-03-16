{ skadiAssets, ... }:
{
  home.file.".face".source = "${skadiAssets}/face.jpg";
  programs.noctalia-shell.settings.general = {
    telemetryEnabled = false;
    language = "en";
    avatarImage = "/home/axel/.face";
    dimmerOpacity = 0.3;

    scaleRatio = 1.0;
    radiusRatio = 0.08;
    iRadiusRatio = 1.0;
    boxRadiusRatio = 1.0;

    showScreenCorners = false;
    forceBlackScreenCorners = false;
    screenRadiusRatio = 1.0;

    animationSpeed = 1.5;
    animationDisabled = false;

    enableBlurBehind = false;
    enableShadows = true;
    shadowDirection = "bottom_right";
    shadowOffsetX = 0.0;
    shadowOffsetY = 0.0;

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
