_: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
  home.file.".face".source = ./assets/face.png;
  imports = [
    ./controlling/index.nix
    ./interface/index.nix
  ];
}
