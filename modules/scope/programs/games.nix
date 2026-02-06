{
  config,
  pkgs,
  ...
}: {
  programs = {
    steam = {
      enable = true;
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
