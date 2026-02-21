{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-frappe-mauve";
  };
  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "frappe";
      accent = "mauve";
      font = "UbuntuSans Nerd Font";
      fontSize = "16";
      userIcon = true;
      background = ../assets/login.png;
      loginBackground = true;
    })
  ];
}
