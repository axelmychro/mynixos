_:
{
  home-manager = {
    users.axel = {
      home = {
        homeDirectory = "/home/axel";
        stateVersion = "24.11";
      };
      xdg.enable = true;
      imports = [
        ./default-apps/index.nix
        ./shell/index.nix
        ./programs/index.nix
      ];
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };
}
