{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      package = pkgs.millennium-steam.override {
        extraArgs = "-system-composer";
      };
    };
    gamemode.enable = true;
  };
}
