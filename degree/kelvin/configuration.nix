_: {
  system.nixos.label = "kelvin";

  imports = [
    ../../nixos/common.nix
    ../../nixos/modules/workspace/desktop/sway.nix
    ../../nixos/modules/workspace/display/ly.nix

    ../../nixos/modules/programs/utilities/alacritty.nix
  ];
}
