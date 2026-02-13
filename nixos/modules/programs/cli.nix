{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tldr

    wget
    curl

    zip
    unzip

    tree
    fd
    ripgrep
    bat
    imagemagick

    btop
    ncdu
    gdu

    cmatrix
    wakatime-cli
  ];
}
