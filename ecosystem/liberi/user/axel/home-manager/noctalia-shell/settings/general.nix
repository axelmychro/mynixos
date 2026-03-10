_: {
  programs.noctalia-shell.settings.general = {
    telemetryEnabled = false;
    language = "en";
    avatarImage = "/home/axel/.face";
    dimmerOpacity = 0.1;

    scaleRatio = 1;
    radiusRatio = 0.25;
    iRadiusRatio = 0.25;
    boxRadiusRatio = 1;

    showScreenCorners = false;
    forceBlackScreenCorners = false;
    screenRadiusRatio = 1;

    animationSpeed = 1;
    animationDisabled = false;

    compactLockScreen = true;
    lockScreenAnimations = true;
    lockOnSuspend = true;

    showSessionButtonsOnLockScreen = false;
    showHibernateOnLockScreen = false;
    enableLockScreenMediaControls = true;

    enableBlurBehind = false;
    enableShadows = false;
    shadowDirection = "bottom_right";
    shadowOffsetX = 2;
    shadowOffsetY = 3;

    allowPanelsOnScreenWithoutBar = true;
    showChangelogOnStartup = true;

    enableLockScreenCountdown = true;
    lockScreenCountdownDuration = 10000;

    autoStartAuth = false;
    allowPasswordWithFprintd = false;

    clockStyle = "custom";
    clockFormat = "hh\nmm a";

    passwordChars = "triangle-filled";
    # "circle-filled", "pentagon-filled", "michelin-star-filled", "square-rounded-filled", "guitar-pick-filled", "blob-filled", "triangle-filled"

    lockScreenMonitors = [ ];

    lockScreenBlur = 0.1;
    lockScreenTint = 0.1;

    keybinds = {
      keyUp = [ "Up" ];
      keyDown = [ "Down" ];
      keyLeft = [ "Left" ];
      keyRight = [ "Right" ];
      keyEnter = [
        "Return"
        "Enter"
      ];
      keyEscape = [ "Esc" ];
      keyRemove = [ "Del" ];
    };
    reverseScroll = false;
  };
}
