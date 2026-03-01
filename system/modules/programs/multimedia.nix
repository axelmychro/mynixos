{
  pkgs,
  spicePkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    qview
    haruna
  ];
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "frappe";
  };
}
