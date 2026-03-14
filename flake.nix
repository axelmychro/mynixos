{
  description = "Like a phoe-nix, cry and rise up from the ash!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

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
      nix-flatpak,
      zen-browser,
      millennium,
      spicetify-nix,
      aagl,

      silentSDDM,
      plasma-manager,

      noctalia,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      zenPkgs = zen-browser.packages.${system};
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      nixosConfigurations = {
        priestess = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              zenPkgs
              spicePkgs
              aagl
              plasma-manager
              ;
          };
          modules = [
            { system.nixos.label = "priestess"; }
            ./system/configuration.nix
            ./user/axel/index.nix
            ./ecosystem/priestess/index.nix

            home-manager.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
            { nixpkgs.overlays = [ millennium.overlays.default ]; }
            aagl.nixosModules.default
            spicetify-nix.nixosModules.default
            silentSDDM.nixosModules.default
          ];
        };
        skadi = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              zenPkgs
              spicePkgs
              aagl
              noctalia
              ;
          };
          modules = [
            { system.nixos.label = "skadi"; }
            ./system/configuration.nix
            ./user/axel/index.nix
            ./ecosystem/skadi/index.nix

            home-manager.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
            {
              nixpkgs.overlays = [
                millennium.overlays.default
              ];
            }
            aagl.nixosModules.default
            spicetify-nix.nixosModules.default
            {
              systemd.settings.Manager = {
                DefaultLimitNOFILE = 1048576;
              };
            }
          ];
        };
      };
    };
}
