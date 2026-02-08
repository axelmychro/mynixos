{ ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      bb = "exec bash";
      x = "exit";

      maintenance = "zeditor /etc/nixos/ && exit";

      lookatthis = "fd -t f . . -E flake.lock -E result -x sh -c 'echo \"--- {} ---\"; bat --style=plain --paging=never \"{}\"'";

      hydrate = "sudo nixos-rebuild dry-run --flake .#mychro";
      hl = "git add . && sudo nixos-rebuild dry-run --flake .#mychro";

      pentest = "sudo nixos-rebuild test --flake .#mychro";
      pl = "git add . && sudo nixos-rebuild test --flake .#mychro";

      kingdomcome = "sudo nixos-rebuild switch --flake .#mychro && reboot";
      kl = "git add . && sudo nixos-rebuild switch --flake .#mychro && reboot";

      oopsmybad = "sudo nixos-rebuild switch --rollback && reboot";

      ihaveamnesia = "nix flake update --extra-experimental-features nix-command && sudo nixos-rebuild switch --flake .#mychro && reboot";

      wd = "waydroid show-full-ui";
      wdx = "waydroid session stop";
    };

    initExtra = builtins.readFile ./script.sh;
  };
}
