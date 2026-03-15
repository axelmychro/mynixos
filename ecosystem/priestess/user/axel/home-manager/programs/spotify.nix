{
  spicePkgs,
  ...
}:
{
  programs.spicetify = {
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "frappe";
  };
}
