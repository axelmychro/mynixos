{ pkgs, ... }:
{
  users.users.axel = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    shell = pkgs.bash;
    ignoreShellProgramCheck = false;
  };
  imports = [
    ./modules/programs/index.nix
    ./modules/services/index.nix
  ];
}
