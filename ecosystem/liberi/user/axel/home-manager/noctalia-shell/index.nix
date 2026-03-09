{ config, noctalia, ... }:
{
  imports = [
    noctalia.homeModules.default
    ./settings/index.nix
  ];
  programs.noctalia-shell.enable = true;

  home.file = {
    ".face".source = ../../assets/face.jpg;

    "Pictures/Wallpapers/orca.jpg".source = ../../assets/orca.jpg;
    ".cache/noctalia/wallpapers.json" = {
      text = builtins.toJSON {
        defaultWallpaper = "${config.home.homeDirectory}/Pictures/Wallpapers/orca.jpg";
        wallpapers = {
          "DP-1" = "${config.home.homeDirectory}/Pictures/Wallpapers/orca.jpg";
        };
      };
    };
  };
}
