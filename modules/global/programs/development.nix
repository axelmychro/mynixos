{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # nixfmt
    nixfmt-rfc-style
    nixd
    vim
    git
    nodejs_20
    pnpm
    vscodium
  ];
}
