{
  pkgs,
  dotconfig,
  ...
}:
{
  imports = [
    ../modules/scope/programs/index.nix
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
    bash = {
      enable = true;
      shellAliases = {
        bb = "exec bash";
        x = "exit";

        maintenance = "zeditor /etc/nixos/ && exit";
        lookatthis = "fd -t f . /etc/nixos -E flake.lock -E result -x sh -c 'echo \"--- {} ---\"; bat --style=plain --paging=never \"{}\"'";
        kingdomcome = "sudo nixos-rebuild switch --flake /etc/nixos#mychro && reboot";
        oopsmybad = "sudo nixos-rebuild switch --rollback && reboot";
        ihaveamnesia = "nix flake update --extra-experimental-features nix-command && sudo nixos-rebuild switch --flake /etc/nixos#mychro && reboot";

        wd = "waydroid show-full-ui";
        wdx = "waydroid session stop";
      };

      initExtra = ''
        eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/catppuccin_frappe.omp.jsonc)"
        clear -x
        fastfetch
      '';
    };

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
