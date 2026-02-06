{ lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./hosts/prts.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services = {
    dbus.enable = true;
    power-profiles-daemon.enable = true;
    xserver.enable = true;
    desktopManager.plasma6.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

  };
  xdg = {
    enable = true;
    portal.enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.fira-code
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];

  programs = {
    steam = {
      enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    alacritty
    nano
    vim
    wget
    curl
    rsync
    openssh
    git
    ripgrep
    fd
    tree
    bat
    fzf
    which
    eza
    btop
    htop
    duf
    ncdu
    fastfetch
    oh-my-posh
    zip
    unzip
    p7zip
    xz
  ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  system.stateVersion = "25.11";
}
