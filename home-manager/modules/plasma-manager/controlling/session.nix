_: {
  programs.plasma = {
    session = {
      general.askForConfirmationOnLogout = false;
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };
    kscreenlocker = {
      lockOnResume = true; # resume = after sleep
      timeout = 5; # minutes before screen is locked
    };
    krunner = {
      activateWhenTypingOnDesktop = true;
      historyBehavior = "disabled";
      position = "top";
    };
    configFile.kdeglobals = {
      General = {
        TerminalApplication = "kitty";
        TerminalService = "kitty.desktop";
      };
    };
  };
}
