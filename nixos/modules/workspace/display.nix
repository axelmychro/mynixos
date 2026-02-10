{
  pkgs,
  ...
}:
{
  services = {
    xserver = {
      enable = true;
      videoDrivers = [
        "intel"
        "nvidia"
      ];
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-frappe-mauve";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.fira-code
  ];

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "frappe";
      accent = "mauve";
      font = "UbuntuSans Nerd Font";
      fontSize = "16";
      userIcon = true;
      loginBackground = true;
      background = ./assets/login.png;
    })
  ];
}
