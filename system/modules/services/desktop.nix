{ pkgs, ... }:
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
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    aurorae
    plasma-browser-integration
    plasma-workspace-wallpapers
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
}
