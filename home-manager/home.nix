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
    ./modules/bash/index.nix
    ./modules/plasma-manager/plasma.nix
    ./modules/mimeapps/index.nix
    ./modules/programs/index.nix
  ];
}
