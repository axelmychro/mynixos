{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git

    wget
    curl

    tree
    fd
    ripgrep
  ];
}
