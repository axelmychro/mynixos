_: {
  system.nixos.label = "skadi";

  _module.args = {
    skadiAssets = ./assets;
  };

  imports = [
    ./system/configuration.nix
    ./user/axel/configuration.nix
  ];
}
