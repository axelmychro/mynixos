{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
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

  networking = {
    hostName = "mychro";
    networkmanager.enable = true;
    firewall.enable = true;
  };
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
    };
  };
  zramSwap.enable = true; # 50% by default

  services = {
    fwupd.enable = true;
    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 1;
      };
    };
    thermald.enable = true;

    pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };

    # note: wayland still needs x11
    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
    };
    # note: manager needs to support wayland to enter its environment
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-frappe-blue";
    };
    desktopManager.plasma6.enable = true;
  };

  users.users.axel = {
    isNormalUser = true;
    extraGroups = ["wheel" "video"];
  };

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.fira-code
  ];

  programs = {
    nix-ld.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
    appimage.enable = true;
  };
  environment.systemPackages = with pkgs; [
    tlp
    nixfmt
    # dev cli
    vim
    kitty
    git
    nodejs_20
    direnv
    just # nginx
    # dev gui
    vscodium
    zed-editor
    # internal
    wget
    unzip
    ripgrep
    fd
    tree
    btop
    curl
    nvtopPackages.nvidia
    xdg-utils
    tldr
    # eye candy
    fastfetch
    oh-my-posh
    cmatrix
    # college
    librewolf
    libreoffice
    spotify
    # games
    heroic

    (
      pkgs.catppuccin-sddm.override {
        flavor = "frappe";
        accent = "blue";
        font = "UbuntuSans Nerd Font";
        fontSize = "16";
        userIcon = true;
        loginBackground = false;
        # background = "${./wallpaper.png}";
      }
    )
  ];
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };
  services.flatpak = {
    enable = true;
    packages = [
      "app.zen_browser.zen"
      "com.vysp3r.ProtonPlus"
      "io.github.eminfedar.vaktisalah-gtk-rs"
    ];
  };

  virtualisation.waydroid.enable = true;

  system.stateVersion = "25.11";
}
