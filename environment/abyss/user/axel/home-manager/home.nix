{
  noctalia,
  abyssAssets,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        noctalia
        abyssAssets
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
