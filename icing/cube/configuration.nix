_: {
  system.nixos.label = "fallen-angel";

  imports = [
    ../../nixos/common.nix

    ../../nixos/modules/boot/index.nix
    ../../nixos/modules/hardware/index.nix
    ../../nixos/modules/programs/index.nix
    ../../nixos/modules/services/index.nix
    ../../nixos/modules/workspace/index.nix
  ];
}
