{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    nodejs_20
    pnpm
  ];
}
