{ config, skadiAssets, ... }:
{
  home.file = {
    "Pictures/Wallpapers/pries.jpg".source = "${skadiAssets}/pries.jpg";
    ".cache/noctalia/wallpapers.json" = {
      text = builtins.toJSON {
        defaultWallpaper = "${config.home.homeDirectory}/Pictures/Wallpapers/pries.jpg";
        wallpapers = {
          "eDP-1" = "${config.home.homeDirectory}/Pictures/Wallpapers/pries.jpg";
        };
      };
    };
  };
  programs.noctalia-shell.settings.wallpaper = {
    enabled = true;
    panelPosition = "center";
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
    transitionEdgeSmoothness = 1;

    overviewEnabled = true;
    overviewBlur = 0.9;
    overviewTint = 0.9;

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
