{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    ./modules/gui/index.nix
    ./modules/hardware/index.nix
    ./modules/programs/index.nix
    ./modules/services/index.nix
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
      options = "--delete-older-than 7d";
    };
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  zramSwap.enable = true;
  # 50% by default

  services.fwupd.enable = true;
  #fwupd is an open-source daemon for managing the installation of firmware updates on Linux-based systems

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
  environment.systemPackages = with pkgs; [
    direnv
    just
    xdg-utils
    nil
  ];

  users = {
    motd = "drop windows rn before it drop you twin";
    users.axel = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
    };
  };

  system.stateVersion = "25.11";
}
