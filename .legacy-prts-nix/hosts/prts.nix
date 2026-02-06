{
  pkgs,
  ...
}:
{
  networking.hostName = "prts-nix";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.axel = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  services.xserver.videoDrivers = [ "intel" ];

  environment = {
    sessionVariables = {
      ELECTRON_DISABLE_GPU = 1;
    };
    systemPackages = with pkgs; [
      librewolf
      vscodium
    ];
  };
}
