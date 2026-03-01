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
    ./default-apps/index.nix
    ./shell/index.nix
    ./programs/index.nix
    ./plasma-manager/plasma.nix
  ];
}
