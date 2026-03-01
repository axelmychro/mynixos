{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    curl

    tree
    fd
    ripgrep
    bat
    imagemagick

    btop
    ncdu
    gdu
  ];
}
