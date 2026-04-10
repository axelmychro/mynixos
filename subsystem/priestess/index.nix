_: {
  system.nixos.label = "priestess";

  _module.args = {
    priestessAssets = ./assets;
  };

  imports = [
    ./user/axel/configuration.nix
  ];
}
