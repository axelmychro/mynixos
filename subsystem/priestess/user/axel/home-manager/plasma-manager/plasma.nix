_: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
  home.file.".face.png".source = ./assets/face.png;
  imports = [
    ./controlling/index.nix
    ./interface/index.nix
  ];
}
