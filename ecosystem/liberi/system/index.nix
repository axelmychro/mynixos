{ pkgs, noctalia, ... }:
{
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = { };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    kdlfmt
    swayidle
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    nnn
    nautilus
  ];
  imports = [ ./niri/index.nix ];
  services.displayManager.ly.enable = true;
}
