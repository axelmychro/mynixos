{ pkgs, ... }:
{
  services.xserver.excludePackages = [ pkgs.xterm ];
  fonts = {
    fontconfig = {
      enable = true;
      subpixel.rgba = "rgb";
      hinting = {
        enable = true;
        style = "full";
      };
    };
    packages = with pkgs; [
      nerd-fonts.geist-mono
    ];
  };
}
