{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    nodejs_20
    pnpm

    nixd
    nixfmt-rfc-style

    shfmt
    shellcheck

    clang-tools
    gcc

    python3
    pyright
    ruff
  ];
}
