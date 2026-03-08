{ noctalia, ... }:
let
  face = ../../assets/face.jpg;
  wallpaper = ../../assets/desktop.jpg;
in
{
  # import the home manager module
  imports = [
    noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure noctalia here
      bar = {
        density = "compact";
        position = "bottom";
        showCapsule = true;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              alwaysShowPercentage = false;
              id = "Battery";
              warningThreshold = 30;
            }
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      colorSchemes.predefinedScheme = "Monochrome";
      general = {
        avatarImage = "/home/axel/.face";
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = true;
        # name = "Marseille, France";
      };
    };
    # this may also be a string or a path to a JSON file.
  };
  home.file = {
    ".face".source = face;
    ".cache/noctalia/wallpapers.json" = {
      text = builtins.toJSON {
        defaultWallpaper = wallpaper;
        wallpapers = {
          "DP-1" = wallpaper;
        };
      };
    };
  };
}
