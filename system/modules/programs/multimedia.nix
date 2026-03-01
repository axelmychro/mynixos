{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    qview
    haruna
  ];
}
