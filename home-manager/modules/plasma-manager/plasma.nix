_: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
  imports = [
    ./controlling/index.nix
    ./interface/index.nix
    ./workflow/session.nix
  ];
}
