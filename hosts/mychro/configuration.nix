{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/global/gui/index.nix
    ../../modules/global/hardware/index.nix

    ../../modules/scope/programs/index.nix
    ../../modules/scope/services/index.nix
  ];

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
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
  ];

  users.users.axel = {
    isNormalUser = true;
    extraGroups = ["wheel" "video"];
  };

  system.stateVersion = "25.11";
}
