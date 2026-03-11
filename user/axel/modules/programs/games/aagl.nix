{ aagl, ... }:
{
  nix.settings = aagl.nixConfig;
  programs = {
    anime-games-launcher.enable = true;
    anime-game-launcher.enable = true;
    honkers-railway-launcher.enable = true;
    honkers-launcher.enable = false;
    wavey-launcher.enable = false;
    sleepy-launcher.enable = false;
  };
}
