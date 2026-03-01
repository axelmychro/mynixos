{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    imagemagick

    btop
    ncdu
    gdu
  ];
}
