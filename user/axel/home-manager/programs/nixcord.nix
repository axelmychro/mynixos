_: {
  programs.nixcord = {
    enable = true;

    discord = {
      enable = false;
      vencord.enable = false;
      equicord.enable = true;
    };
    vesktop = {
      enable = true;
      useSystemVencord = false;
    };
    dorion.enable = false;

    config = {
      useQuickCss = true;
      frameless = true;

      autoUpdate = false;
      autoUpdateNotification = false;
      notifyAboutUpdates = false;

      plugins = {
        noTypingAnimation.enable = true;
        betterSettings = {
          enable = true;
          disableFade = true;
          eagerLoad = true;
          organizeMenu = true;
        };
        consoleJanitor.enable = true;

        ClearURLs.enable = true;
        CopyUserURLs.enable = true;
        MutualGroupDMs.enable = true;
        CustomRPC.enable = true;
      };
    };
  };
}
