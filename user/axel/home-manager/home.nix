{
  ...
}:
{
  home = {
    homeDirectory = "/home/axel";
    stateVersion = "24.11";
  };
  xdg.enable = true;
  imports = [
    ./modules/default-apps/index.nix
    ./modules/shell/index.nix
    ./modules/programs/index.nix
    ./plasma-manager/plasma.nix
  ];
}
