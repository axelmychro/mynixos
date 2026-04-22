{ lib, pkgs, ... }:
{
  services.xserver.excludePackages = [ pkgs.xterm ];
  fonts = {
    fontconfig = {
      enable = true;
      subpixel.rgba = "rgb";
      hinting = {
        enable = true;
        style = "full";
      };
    };
    packages = with pkgs; [
      nerd-fonts.geist-mono
    ];
  };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = lib.mkForce true;
  };

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
    backgrounds = {
      "pries.mp4" = ../../assets/pries.mp4;
    };

    settings = {
      "LoginScreen" = {
        background = "pries.mp4";
      };
      "LockScreen" = {
        background = "pries.mp4";
      };
      "LockScreen.Message" = {
        text = "Welcome back, Oracle.";
      };
    };
  };
  system.activationScripts.face = {
    text = ''
      rm -f /var/lib/AccountsService/icons/*
      ln -sfn ${../../assets/face.jpg} /var/lib/AccountsService/icons/axel
    '';
  };
}
