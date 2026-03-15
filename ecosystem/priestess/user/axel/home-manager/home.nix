{
  plasma-manager,
  spicetify-nix,
  spicePkgs,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = { inherit spicePkgs; };
    users.axel = {
      imports = [
        ./programs/index.nix
        ./plasma-manager/plasma.nix
        ./shell/index.nix
      ];
    };
    sharedModules = [
      plasma-manager.homeModules.plasma-manager
      spicetify-nix.homeManagerModules.spicetify
    ];
  };
}
