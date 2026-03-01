{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    zathura
  ];
}
