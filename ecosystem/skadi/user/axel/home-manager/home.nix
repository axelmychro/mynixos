{
  noctalia,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = { inherit noctalia; };
    users.axel = {
      xdg.configFile."niri/config.kdl".source = ../config/niri/config.kdl;
      imports = [
        ./noctalia-shell/index.nix
        ./programs/index.nix
        ./shell/index.nix
      ];
    };
  };
}
