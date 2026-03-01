{
  pkgs,
  lib,
  ...
}:
{
  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.fira-code
  ];

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
    };
  };

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
