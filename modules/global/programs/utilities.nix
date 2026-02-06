{ pkgs, ... }:
{
  virtualisation.waydroid.enable = true;

  environment.systemPackages = with pkgs; [
    opensnitch-ui
  ];
}
