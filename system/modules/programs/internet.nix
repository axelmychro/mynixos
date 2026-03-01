{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    librewolf
    zoom-us
  ];
  services.flatpak.packages = [
    "app.zen_browser.zen"
    "com.google.Chrome"
  ];
}
