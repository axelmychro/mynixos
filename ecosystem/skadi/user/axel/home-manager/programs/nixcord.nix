{ skadiAssets, ... }:
{
  programs.nixcord.quickCss = builtins.readFile "${skadiAssets}/system24-nord.theme.css";
}
