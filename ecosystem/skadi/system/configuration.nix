{
  pkgs,
  noctalia,
  ...
}:
{
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    cage
    regreet
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    wl-clipboard
    nautilus
    nnn
  ];
  imports = [ ./modules/index.nix ];
}
