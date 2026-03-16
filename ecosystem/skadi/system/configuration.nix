{ pkgs, noctalia, ... }:
{
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = { };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    wl-clipboard
    kdlfmt
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    nnn
    nautilus
  ];
  services.displayManager.ly.enable = true;
  programs.fish.enable = true;
  imports = [ ./modules/index.nix ];
}
