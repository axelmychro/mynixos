{ config, ... }:
{
  home.file = {
    "Pictures/Wallpapers/orca.jpg".source = ../../../assets/orca.jpg;
    ".cache/noctalia/wallpapers.json" = {
      text = builtins.toJSON {
        defaultWallpaper = "${config.home.homeDirectory}/Pictures/Wallpapers/orca.jpg";
        wallpapers = {
          "DP-1" = "${config.home.homeDirectory}/Pictures/Wallpapers/orca.jpg";
        };
      };
    };
  };
  programs.noctalia-shell.settings.wallpaper = {
    enabled = true;
    overviewEnabled = false;
    directory = "${config.home.homeDirectory}/Pictures/Wallpapers";

    showHiddenFiles = false;
    hideWallpaperFilenames = false;

    monitorDirectories = [ ];
    enableMultiMonitorDirectories = false;

    viewMode = "single";
    setWallpaperOnAllMonitors = true;
    fillMode = "crop";
    fillColor = "#2e3440";

    useSolidColor = false;
    solidColor = "#2e3440";

    automationEnabled = false;
    wallpaperChangeMode = "random";
    randomIntervalSec = 300;

    skipStartupTransition = false;
    transitionDuration = 1500;
    transitionType = "random";
    transitionEdgeSmoothness = 0.05;

    panelPosition = "follow_bar";
    overviewBlur = 0.1;
    overviewTint = 0.1;

    useWallhaven = false;
    wallhavenQuery = "";
    wallhavenSorting = "relevance";
    wallhavenOrder = "desc";
    wallhavenCategories = "111";
    wallhavenPurity = "100";
    wallhavenRatios = "";
    wallhavenApiKey = "";
    wallhavenResolutionMode = "atleast";
    wallhavenResolutionWidth = "";
    wallhavenResolutionHeight = "";
    sortOrder = "name";
    favorites = [ ];
  };
}
