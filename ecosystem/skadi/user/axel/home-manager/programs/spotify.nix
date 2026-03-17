{
  spicePkgs,
  ...
}:
{
  programs.spicetify = {
    theme = spicePkgs.themes.text;
    colorScheme = "Nord";
  };
}
