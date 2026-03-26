{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    qview
    haruna
  ];
  imports = [
    ./obs-studio.nix
  ];
}
