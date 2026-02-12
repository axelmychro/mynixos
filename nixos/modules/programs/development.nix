{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # nil
    nixd
    # nixfmt
    nixfmt-rfc-style

    shfmt
    shellcheck

    clang-tools
    gcc

    micro
    vim

    git
    nodejs_20
    pnpm
  ];
}
