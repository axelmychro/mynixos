{
  pkgs,
  ...
}:
{
  programs = {
    steam = {
      enable = true;
      package = pkgs.millennium-steam;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [
    heroic
    osu-lazer-bin
  ];
  services.flatpak.packages = [
    "com.vysp3r.ProtonPlus"
  ];
}
