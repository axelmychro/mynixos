{ pkgs, ... }:
{
  virtualisation.waydroid.enable = true;
  environment.systemPackages = with pkgs; [
    alacritty
    keyd
    peazip
  ];
}
