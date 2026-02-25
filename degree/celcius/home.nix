_: {
  imports = [
    ../../home-manager/common.nix

    ../../home-manager/modules/plasma-manager/plasma.nix
    ../../home-manager/modules/programs/kitty.nix
  ];
  programs.plasma.shortcuts."services/kitty.desktop" = {
    "_launch" = "Meta+Return";
  };
}
