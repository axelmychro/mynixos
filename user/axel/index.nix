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
}
