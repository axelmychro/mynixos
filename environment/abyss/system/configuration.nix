{
  pkgs,
  noctalia,
  ...
}:
{
  programs.niri.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite
    wl-clipboard
    nautilus
  ];
}
