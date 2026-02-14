_: {
  # Quick Catppuccin Frappe Mauve config
  # Once generated, cannot be configured. stick with plasma management in the long term
  # xdg.configFile = {
  #   "kdeglobals".source = ./config/kdeglobals;
  #   "kwinrc".source = ./config/kwinrc;
  # };

  programs = {
    kate.enable = false; # we have zeditor
    okular.enable = false; # we have libreoffice
    konsole.enable = false; # we have kitty

    plasma = {
      enable = true;
      overrideConfig = true;
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
  };
  imports = [
    ./controlling/index.nix
    ./interface/index.nix
  ];
}
