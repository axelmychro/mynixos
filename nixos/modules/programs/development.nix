{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    micro
    vim

    git
    nodejs_20
    pnpm

    # nil
    nixd
    # nixfmt
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
