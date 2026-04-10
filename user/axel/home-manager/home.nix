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
          package = lib.mkDefault pkgs.vanilla-dmz;
          name = lib.mkDefault "Vanilla-DMZ";
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
