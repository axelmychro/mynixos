{
  pkgs,
  lib,
  ...
}:
{
  services = {
    xserver = {
      enable = true;
      videoDrivers = [
        "nvidia"
      ];
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = lib.mkForce true;
      # theme = "catppuccin-frappe-mauve";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.fira-code
  ];

  # environment.systemPackages = with pkgs; [
  #   (catppuccin-sddm.override {
  #     flavor = "frappe";
  #     accent = "mauve";
  #     font = "UbuntuSans Nerd Font";
  #     fontSize = "16";
  #     userIcon = true;
  #     background = ./assets/login.png;
  #     loginBackground = true;
  #   })
  # ];
  #
  programs.silentSDDM = {
    enable = true;
    theme = "rei";
    backgrounds = {
      "rei.mp4" = ./assets/rei.mp4;
    };

    settings = {
      "LoginScreen" = {
        background = "rei.mp4";
      };
      "LockScreen" = {
        background = "rei.mp4";
      };
      "LockScreen.Message" = {
        text = "Welcome back, Oracle.";
      };
    };
  };
}
