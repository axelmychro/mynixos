{
  username,
  dotconfig,
  ...
}:
{
  imports = [
    ./modules/bash/script.nix
    ./modules/plasma-manager/plasma.nix
    ./modules/programs/index.nix
  ];

  home.homeDirectory = "/home/${username}";

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

  home.file = {
    ".wakatime.cfg".source = dotconfig + /wakatime/wakatime.cfg;
  };
  xdg = {
    enable = true;

    configFile = {
      "fastfetch" = {
        source = dotconfig + /fastfetch;
        recursive = true;
      };
    };
  };

  home.stateVersion = "24.11";
}
