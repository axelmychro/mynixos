{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    libreoffice
    zathura
  ];
}
