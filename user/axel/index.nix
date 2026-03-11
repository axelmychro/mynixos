{ pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.bash;
    users.axel = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "video"
        "render"
      ];
      shell = pkgs.bash;
    };
  };
  imports = [
    ./modules/programs/index.nix
    ./modules/services/index.nix
    ./home-manager/home.nix
  ];
}
