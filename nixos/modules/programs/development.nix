{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # nixfmt
    nixfmt-rfc-style
    nixd
    micro
    vim

    git
    nodejs_20
    pnpm
  ];
}
