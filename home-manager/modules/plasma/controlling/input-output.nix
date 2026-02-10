{ ... }:
{
  programs.plasma = {
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
  };
}
