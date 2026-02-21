_: {
  imports = [
    ../../home-manager/common.nix
    ../../home-manager/modules/plasma-manager/plasma.nix
  ];
  programs.plasma.shortcuts."services/Alacritty.desktop" = {
    "_launch" = "Meta+Return";
  };
}
