{
  description = "Like a phoe-nix, cry and rise up from the ash!";

  inputs = {
    # core
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    floorp.url = "github:fyukmdaa/floorp-flake";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:FlameFlag/nixcord";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # priestess
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # skadi
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
      floorp,
      zen-browser,
      firefox-addons,
      nixcord,
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

      spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      nixosConfigurations = {
        priestess = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              floorp
              zen-browser
              firefox-addons
              nixcord
              spicetify-nix
              spicePkgs
              aagl
              plasma-manager
              ;
          };
          modules = [
            ./system/configuration.nix
            ./user/axel/configuration.nix
            ./ecosystem/priestess/index.nix

            home-manager.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
            {
              nixpkgs.overlays = [
                floorp.overlays.default
                millennium.overlays.default
              ];
            }
            spicetify-nix.nixosModules.default
            aagl.nixosModules.default
            silentSDDM.nixosModules.default
          ];
        };
        skadi = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              floorp
              nixpkgs
              zen-browser
              firefox-addons
              nixcord
              spicetify-nix
              spicePkgs
              aagl
              noctalia
              ;
          };
          modules = [
            ./system/configuration.nix
            ./user/axel/configuration.nix
            ./ecosystem/skadi/index.nix

            home-manager.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
            {
              nixpkgs.overlays = [
                floorp.overlays.default
                millennium.overlays.default
              ];
            }
            aagl.nixosModules.default
            spicetify-nix.nixosModules.default
          ];
        };
      };
    };
}
