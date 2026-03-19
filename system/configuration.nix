{
  pkgs,
  ...
}:
{
  _module.args = {
    systemAssets = ./assets;
  };

  system = {
    stateVersion = "25.11";
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_6_12;
    kernelModules = [ "ideapad_laptop" ];
  };

  networking.hostName = "mychro";

  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      cores = 8;
      max-jobs = 2;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
  };
  services.fwupd.enable = true; # linux FOSS firmware update daemon
  zramSwap.enable = true; # 50% by default

  imports = [
    ./hardware-configuration.nix

    ./modules/boot/index.nix
    ./modules/hardware/index.nix
    ./modules/programs/index.nix
    ./modules/services/index.nix
  ];
}
