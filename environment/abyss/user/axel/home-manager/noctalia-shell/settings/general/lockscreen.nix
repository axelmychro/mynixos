_: {
  programs.noctalia-shell.settings.general = {
    enableLockScreenCountdown = true;
    lockScreenCountdownDuration = 10000;
    lockOnSuspend = true;

    clockStyle = "custom";
    clockFormat = "hh\nmm\na";

    lockScreenAnimations = true;
    compactLockScreen = false;
    showSessionButtonsOnLockScreen = false;
    showHibernateOnLockScreen = false;
    enableLockScreenMediaControls = true; # doesn't show if compact

    lockScreenBlur = 0.1;
    lockScreenTint = 0.1;

    lockScreenMonitors = [ ];
  };
}
