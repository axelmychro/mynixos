{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    librewolf
  ];
  services.flatpak.packages = [
    "app.zen_browser.zen"
  ];
}
