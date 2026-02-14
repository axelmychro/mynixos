{
  username,
  ...
}:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelModules = [ "ideapad_laptop" ];
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

  imports = [
    ./hardware-configuration.nix

    ./modules/hardware/index.nix
    ./modules/programs/index.nix
    ./modules/services/index.nix
    ./modules/workspace/index.nix
  ];

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

  users = {
    motd = "drop windows rn before it drop you twin";
    users.${username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
    };
  };

  system = {
    stateVersion = "25.11";
    nixos.label = "fallen-angel";
  };
}
