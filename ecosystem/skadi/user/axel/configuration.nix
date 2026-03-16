{ pkgs, ... }:
{
  users.users.axel.shell = pkgs.fish;
  imports = [
    ./home-manager/home.nix
  ];
}
