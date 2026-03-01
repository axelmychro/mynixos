{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    zoom-us
  ];
  services.flatpak.packages = [
    "app.zen_browser.zen"
    "com.google.Chrome"
  ];
}
