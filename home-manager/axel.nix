{
  pkgs,
  dotconfig,
  ...
}:
{
  imports = [
    ./modules/bash/script.nix
    ./modules/programs/index.nix
  ];

  home = {
    username = "axel";
    homeDirectory = "/home/axel";

    packages = with pkgs; [
      kitty
      fastfetch
      oh-my-posh
    ];
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "Axel";
          email = "axelmychro@gmail.com";
        };
        init.defaultBranch = "main";
      };
    };
  };

  xdg = {
    enable = true;

    configFile = {
      "kitty" = {
        source = dotconfig + /kitty;
        recursive = true;
      };
      "fastfetch" = {
        source = dotconfig + /fastfetch;
        recursive = true;
      };
      "oh-my-posh/catppuccin_frappe.omp.jsonc" = {
        source = dotconfig + /oh-my-posh/catppuccin_frappe.omp.jsonc;
        recursive = true;
      };
    };
  };

  home.stateVersion = "24.11";
}
