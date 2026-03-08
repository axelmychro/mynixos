{
  plasma-manager,
  ...
}:
{
  home-manager = {
    users.axel = {
      imports = [ ./plasma-manager/plasma.nix ];
    };
    sharedModules = [ plasma-manager.homeModules.plasma-manager ];
  };
}
