{
  description = "my chemical rebuild";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      plasma-manager,
      nix-flatpak,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "axel";

      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      nixosConfigurations.mychro = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit username spicePkgs; };

        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [ plasma-manager.homeModules.plasma-manager ];
              backupFileExtension = "backup";
              users.${username} = import ./home-manager/home.nix;
              extraSpecialArgs = {
                inherit username;
              };
            };
          }
          nix-flatpak.nixosModules.nix-flatpak
          {
            nixpkgs.overlays = [ inputs.millennium.overlays.default ];
          }
          {
            imports = [ inputs.silentSDDM.nixosModules.default ];
          }
          inputs.spicetify-nix.nixosModules.default
        ];
      };
      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
