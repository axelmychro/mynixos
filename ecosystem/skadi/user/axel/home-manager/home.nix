{
  noctalia,
  zen-browser,
  firefox-addons,
  pkgs,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = { inherit noctalia firefox-addons; };
    users.axel = {
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
          name = "Nordzy-cursors-white";
          package = pkgs.nordzy-cursor-theme;
        };
      };
      qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "nordic";
      };
    };
  };
}
