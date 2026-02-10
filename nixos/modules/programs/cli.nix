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

    btop
    ncdu
    gdu

    cmatrix
    wakatime-cli
  ];
}
