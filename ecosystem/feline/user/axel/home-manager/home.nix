{
  plasma-manager,
  ...
}:
{
  home-manager = {
    users.axel = {
      imports = [
        ./programs/index.nix
        ./plasma-manager/plasma.nix
        ./shell/index.nix
      ];
    };
    sharedModules = [ plasma-manager.homeModules.plasma-manager ];
  };
}
