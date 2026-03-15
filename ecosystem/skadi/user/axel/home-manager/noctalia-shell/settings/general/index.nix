{ skadiAssets, ... }:
{
  home.file.".face".source = "${skadiAssets}/face.jpg";
  programs.noctalia-shell.settings.general = {
    telemetryEnabled = false;
    language = "en";
    avatarImage = "/home/axel/.face";
    dimmerOpacity = 0.2;

    scaleRatio = 1.0;
    radiusRatio = 0.08;
    iRadiusRatio = 0.08;
    boxRadiusRatio = 1.0;

    showScreenCorners = false;
    forceBlackScreenCorners = false;
    screenRadiusRatio = 1.0;

    animationSpeed = 1.0;
    animationDisabled = false;

    enableBlurBehind = true;
    enableShadows = true;
    shadowDirection = "bottom_right";
    shadowOffsetX = 3.0;
    shadowOffsetY = 2.0;

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
