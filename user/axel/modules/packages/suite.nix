{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    libreoffice
    zoom-us
    obsidian
    pspp
  ];
}
