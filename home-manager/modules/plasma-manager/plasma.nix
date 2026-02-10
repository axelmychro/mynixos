{ ... }:
{
  # Quick Catppuccin Frappe Mauve config
  # Once generated, cannot be configured. stick with plasma management in the long term
  # xdg.configFile = {
  #   "kdeglobals".source = ./config/kdeglobals;
  #   "kwinrc".source = ./config/kwinrc;
  # };

  programs = {
    kate.enable = false; # we have codium and zeditor
    okular.enable = false; # we have libreoffice
    konsole.enable = false; # we have kitty

    plasma = {
      enable = true;
      overrideConfig = true;
      session = {
        general.askForConfirmationOnLogout = false;
        sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };
    };
  };
  imports = [
    ./controlling/index.nix
    ./interface/index.nix
  ];
}
