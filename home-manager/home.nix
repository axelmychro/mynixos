{
  username,
  ...
}:
{
  home = {
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
  xdg.enable = true;
  imports = [
    ./modules/default-apps/index.nix
    ./modules/shell/index.nix
    ./modules/plasma-manager/plasma.nix
    ./modules/programs/index.nix
  ];
}
