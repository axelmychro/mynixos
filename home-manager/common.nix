{
  username,
  ...
}:
{
  home = {
    stateVersion = "24.11";
    homeDirectory = "/home/${username}";
  };
  xdg.enable = true;
  imports = [
    ./modules/default-apps/index.nix
    ./modules/shell/index.nix
    ./modules/programs/index.nix
  ];
}
