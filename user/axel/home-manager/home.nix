{
  lib,
  pkgs,
  ...
}:
{
  home-manager = {
    users.axel = {
      home = {
        homeDirectory = "/home/axel";
        stateVersion = "24.11";
        pointerCursor = {
          enable = true;
          package = lib.mkDefault pkgs.nordzy-cursor-theme;
          name = lib.mkDefault "Nordzy-cursors-white";
          size = 48;

          x11 = {
            enable = true;
            defaultCursor = "left_ptr";
          };
          gtk.enable = true;
        };
      };
      xdg.enable = true;
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
      };
      qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "Nordic";
      };
      imports = [
        ./default-apps/index.nix
        ./programs/index.nix
        ./shell/index.nix
      ];
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };
}
