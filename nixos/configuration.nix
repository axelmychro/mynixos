{
  username,
  pkgs,
  ...
}:
{
  system = {
    stateVersion = "25.11";
    nixos.label = "fallen-angel";
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_6_12;
    kernelModules = [ "ideapad_laptop" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "mychro";
    networkmanager.enable = true;
  };
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;
  programs = {
    nix-ld.enable = true;
    appimage.enable = true;
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
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

    ./modules/hardware/index.nix
    ./modules/programs/index.nix
    ./modules/services/index.nix
    ./modules/workspace/index.nix
  ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
  };
}
