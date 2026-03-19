{ pkgs, ... }:
{
  boot = {
    loader = {
      timeout = 10;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = false;
        configurationLimit = 10;
        consoleMode = "0";
      };
      grub = {
        enable = true;
        configurationName = "neeks";
        configurationLimit = 10;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
        gfxmodeEfi = "1920x1080";
        gfxpayloadEfi = "keep";
        gfxmodeBios = "1920x1080";
        gfxpayloadBios = "keep";

        font = ./assets/FiraCodeNerdFont-Regular.ttf;
        fontSize = 16;

        backgroundColor = "#ff000";
        # theme = ./assets/catppuccin-frappe-grub-theme;
        # splashImage = ./assets/splashImage.png;
        splashMode = "normal";
      };
    };
  };
}
