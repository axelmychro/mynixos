{
  pkgs,
  ...
}:
{
  imports = [ ./steam/index.nix ];
  services.flatpak.packages = [
    "com.vysp3r.ProtonPlus"
  ];
  environment.systemPackages = with pkgs; [
    osu-lazer-bin
  ];
}
