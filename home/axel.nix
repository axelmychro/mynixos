{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "axel";
    homeDirectory = "/home/axel";
  };
  programs = {
    bash = {
      enable = true;

      shellAliases = {
        bb = "exec bash";
        maintenance = "codium /etc/nixos/ && exit";
        kingdomcome = "sudo nixos-rebuild switch --flake /etc/nixos#mychro && reboot";
        oopsmybad = "sudo nixos-rebuild switch --rollback && reboot";
        ihaveamnesia = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake .#mychro && reboot";
        ricenow = "codium ~ && exit";
        wd = "waydroid show-full-ui";
        wdx = "waydroid session stop";
      };

      initExtra = ''
        eval "$(oh-my-posh init bash --config ~/catppuccin_frappe.omp.jsonc)"
        clear -x
        fastfetch
      '';
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  home.stateVersion = "24.11";
}
