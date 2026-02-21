{
  username,
  ...
}:
{
  home = {
    stateVersion = "24.11";
    homeDirectory = "/home/${username}";
  };
  xdg.enable = true;
}
