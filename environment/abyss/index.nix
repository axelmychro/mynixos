_: {
  system.nixos.label = "abyss";

  _module.args = {
    abyssAssets = ./assets;
  };

  imports = [
    ./system/configuration.nix
    ./user/axel/configuration.nix
  ];
}
