_: {
  programs.noctalia-shell.settings.general = {
    telemetryEnabled = false;
    avatarImage = "/home/axel/.face";
    dimmerOpacity = 0.2;

    showScreenCorners = false;
    forceBlackScreenCorners = false;

    scaleRatio = 1;
    radiusRatio = 0.2;
    iRadiusRatio = 1.0;
    boxRadiusRatio = 1;
    screenRadiusRatio = 1;

    animationSpeed = -1;
    animationDisabled = false;

    compactLockScreen = false;
    lockScreenAnimations = true;
    lockOnSuspend = true;

    showSessionButtonsOnLockScreen = true;
    showHibernateOnLockScreen = false;
    enableLockScreenMediaControls = true;

    enableBlurBehind = false;
    enableShadows = false;
    shadowDirection = "bottom_right";
    shadowOffsetX = 2;
    shadowOffsetY = 3;

    language = "en";

    allowPanelsOnScreenWithoutBar = true;
    showChangelogOnStartup = true;

    enableLockScreenCountdown = true;
    lockScreenCountdownDuration = 10000;

    autoStartAuth = false;
    allowPasswordWithFprintd = false;

    clockStyle = "custom";
    clockFormat = "hh\nmm";

    passwordChars = false;

    lockScreenMonitors = [ ];

    lockScreenBlur = 0.0;
    lockScreenTint = 0.0;

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
