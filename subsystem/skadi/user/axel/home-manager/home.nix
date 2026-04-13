{
  noctalia,
  skadiAssets,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        noctalia
        skadiAssets
        ;
    };
    users.axel = {
      imports = [
        ./niri/index.nix
        ./noctalia-shell/index.nix
      ];
    };
  };
}
