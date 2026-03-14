{ noctalia, ... }:
{
  imports = [
    noctalia.homeModules.default
    ./settings/index.nix
  ];
  programs.noctalia-shell.enable = true;
}
