{
  config,
  pkgs,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-frappe-blue";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.fira-code
  ];

  environment.systemPackages = with pkgs; [
    (
      pkgs.catppuccin-sddm.override {
        flavor = "frappe";
        accent = "blue";
        font = "UbuntuSans Nerd Font";
        fontSize = "16";
        userIcon = true;
        loginBackground = false;
        # background = "${./wallpaper.png}";
      }
    )
  ];
}
