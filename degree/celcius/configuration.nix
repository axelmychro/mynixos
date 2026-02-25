_: {
  system.nixos.label = "celcius";

  imports = [
    ../../nixos/common.nix
    ../../nixos/modules/workspace/desktop/plasma6.nix
    ../../nixos/modules/workspace/display/sddm.nix

    ../../nixos/modules/programs/utilities/kitty.nix
    ../../nixos/modules/programs/games/steam/millennium-steam.nix
  ];
}
