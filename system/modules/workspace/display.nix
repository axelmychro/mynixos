{
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.fira-code
  ];

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };
}
