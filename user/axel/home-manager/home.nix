{ nixcord, ... }:
{
  home-manager = {
    users.axel = {
      home = {
        homeDirectory = "/home/axel";
        stateVersion = "24.11";
        pointerCursor = {
          enable = true;
          size = 48;

          x11 = {
            enable = true;
            defaultCursor = "left_ptr";
          };
          gtk.enable = true;
        };
      };
      xdg.enable = true;
      imports = [
        nixcord.homeModules.nixcord
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
