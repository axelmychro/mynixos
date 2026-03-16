_: {
  system.nixos.label = "priestess";

  imports = [
    ./system/configuration.nix
    ./user/axel/configuration.nix
  ];
}
