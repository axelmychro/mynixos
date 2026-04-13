# {{{
# HELLO $USER
# }}}
{
  description = "Like a phoe-nix, cry and rise up from the ash!";

  inputs = {
    # {{{
    # CORE INPUTS
    # }}}
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    # { $HOME }
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # {{{
    # DESKTOP ENVIRONMENT
    # }}}

    # { DISPLAY MANAGER }
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # { BAR, NOTIFICATION, LAUNCHER, LOCK SCREEN, and IDLE DAEMON }
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };
    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      silentSDDM,
      noctalia,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      nixosConfigurations = {
        skadi = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              nixpkgs
              noctalia
              ;
          };
          modules = [
            ./system/configuration.nix
            ./user/axel/configuration.nix
            ./environment/abyss/index.nix

            home-manager.nixosModules.home-manager
            silentSDDM.nixosModules.default
          ];
        };
      };
    };
}
