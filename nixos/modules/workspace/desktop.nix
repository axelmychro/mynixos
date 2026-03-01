{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    aurorae
    plasma-browser-integration
    plasma-workspace-wallpapers
    ark
    elisa
    gwenview
    okular
    kate
    ktexteditor
    khelpcenter
    baloo
    baloo-widgets
    dolphin-plugins
  ];
  services.xserver.excludePackages = [ pkgs.xterm ];
}
