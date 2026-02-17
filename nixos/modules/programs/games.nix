{
  pkgs,
  ...
}:
{
  services.flatpak.packages = [
    "com.vysp3r.ProtonPlus"
  ];
  programs = {
    steam = {
      enable = true;
      package = pkgs.millennium-steam;
      gamescopeSession.enable = false;
    };
    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [
    osu-lazer-bin
  ];
}
