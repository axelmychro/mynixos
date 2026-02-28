_: {
  programs.plasma = {
    kwin.virtualDesktops = {
      number = 8;
      rows = 2;
      names = [
        "󰜌"
        ""
        ""
        ""
        ""
        "󰭹"
        "󰺵"
        "󰏗"
      ];
    };
    session = {
      general.askForConfirmationOnLogout = false;
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };
    kscreenlocker = {
      lockOnResume = true; # resume = after sleep
      timeout = 5; # minutes before screen is locked
    };
    krunner = {
      shortcuts.launch = [ "Meta+R" ];
      activateWhenTypingOnDesktop = false;
      historyBehavior = "disabled";
      position = "center";
    };
    configFile.kdeglobals = {
      General = {
        TerminalApplication = "ghostty";
        TerminalService = "com.mitchellh.ghostty.desktop";
      };
    };
  };
}
