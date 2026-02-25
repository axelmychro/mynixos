{ pkgs, ... }:
{
  virtualisation.waydroid.enable = true;
  environment.systemPackages = with pkgs; [
    kitty
    ghostty
    keyd
    peazip
  ];
}
