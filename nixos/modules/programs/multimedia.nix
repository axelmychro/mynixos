{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    qview
    feh
    haruna

    libreoffice
    zathura

    spotify
  ];
}
