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
  ];
  services.flatpak.packages = [
    "com.vysp3r.ProtonPlus"
  ];
}
