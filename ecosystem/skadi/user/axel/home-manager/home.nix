{
  noctalia,
  zen-browser,
  firefox-addons,
  pkgs,
  ...
}:
let
  skadiPixelCursors = pkgs.stdenv.mkDerivation {
    name = "skadi-pixel-cursors";
    src = ../assets/skadi-pixel-cursors;
    installPhase = ''
      mkdir -p $out/share/icons/skadi-pixel-cursors/cursors
      cp -r cursors/* $out/share/icons/skadi-pixel-cursors/cursors/
      cp index.theme $out/share/icons/skadi-pixel-cursors/index.theme
    '';
  };
in
{
  home-manager = {
    extraSpecialArgs = { inherit noctalia firefox-addons; };
    users.axel = {
      home.pointerCursor = {
        package = skadiPixelCursors;
        name = "skadi-pixel-cursors";
      };
      xdg.configFile."niri/config.kdl".source = ../config/niri/config.kdl;
      imports = [
        zen-browser.homeModules.twilight
        ./noctalia-shell/index.nix
        ./programs/index.nix
        ./shell/index.nix
      ];

      gtk = {
        enable = true;
        theme = {
          name = "Nordic";
          package = pkgs.nordic;
        };
        iconTheme = {
          name = "Nordzy";
          package = pkgs.nordzy-icon-theme;
        };
        cursorTheme = {
          name = "skadi-pixel-cursors";
          package = skadiPixelCursors;
        };
      };
      qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "Nordic";
      };
    };
  };
}
