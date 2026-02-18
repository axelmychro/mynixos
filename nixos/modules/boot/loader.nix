{ pkgs, ... }:
let
  catppuccin-grub = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "grub";
    rev = "0a37ab1";
    hash = "sha256-jgM22pvCQvb0bjQQXoiqGMgScR9AgCK3OfDF5Ud+/mk=";
  };
in
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      gfxmodeBios = "1920x1080";
      gfxpayloadBios = "keep";
      gfxmodeEfi = "1920x1080";
      gfxpayloadEfi = "keep";

      theme = "${catppuccin-grub}/src/catppuccin-frappe-grub-theme";
    };
  };
}
