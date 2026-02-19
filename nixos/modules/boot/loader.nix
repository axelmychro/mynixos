_: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      gfxmodeBios = "1920x1080";
      gfxpayloadBios = "keep";
      gfxmodeEfi = "1920x1080";
      gfxpayloadEfi = "keep";

      splashImage = ./assets/splashImage.png;
      theme = ./assets/catppuccin-frappe-grub-theme;
    };
  };
}
