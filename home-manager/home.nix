{
  username,
  dotconfig,
  ...
}:
{
  home = {
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";

    file.".wakatime.cfg".source = dotconfig + /wakatime/wakatime.cfg;
  };
  xdg.enable = true;
  imports = [
    ./modules/bash/index.nix
    ./modules/plasma-manager/plasma.nix
    ./modules/mimeapps/index.nix
    ./modules/programs/index.nix
  ];
}
