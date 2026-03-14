_: {
  programs.nixcord = {
    enable = true;

    discord = {
      enable = false;
      vencord.enable = true;
      equicord.enable = false;
    };
    vesktop = {
      enable = true;
      useSystemVencord = false;
    };
    dorion.enable = false;

    useQuickCss = true;
    quickCss = "/* css goes here */";
    config = {
      frameless = true;

      autoUpdate = false;
      autoUpdateNotification = false;
      notifyAboutUpdates = true;

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
        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
          ignoredActivities = { };
        };
      };
    };
  };
}
