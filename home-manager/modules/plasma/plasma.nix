{ ... }:
{
  # Once generated, cannot be configured. stick with system settings in the long term
  # xdg.configFile = {
  #   "kdeglobals".source = ./config/kdeglobals;
  #   "kwinrc".source = ./config/kwinrc;
  # };

  programs = {
    kate.enable = false;
    okular.enable = false;
    konsole.enable = false;

    plasma = {
      enable = true;
      session = {
        general.askForConfirmationOnLogout = false;
        sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };
      workspace = {
        wallpaper = ./desktop.jpg;
      };
      input = {
        mice = [
          {
            vendorId = "046d";
            productId = "c077";
            name = "Logitech USB Optical Mouse";
            enable = true;
            acceleration = -0.2;
            accelerationProfile = "none";
            leftHanded = false;
            middleButtonEmulation = false;
            naturalScroll = false;
            scrollSpeed = 1;
          }
        ];
        keyboard.numlockOnStartup = "on";
      };
      kwin.titlebarButtons = {
        left = [
          "close"
          "maximize"
          "minimize"
        ];
        right = [ ];
      };
      overrideConfig = true;
    };
  };
}
