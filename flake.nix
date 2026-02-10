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

    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      plasma-manager,
      nix-flatpak,
      alejandra,
      ...
    }:
    let
      system = "x86_64-linux";
      username = "axel";
      dotconfig = ./home-manager/config;
    in
    {
      nixosConfigurations.mychro = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit username; };

        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [ plasma-manager.homeModules.plasma-manager ];
              backupFileExtension = "backup";
              users."${username}" = import ./home-manager/${username}.nix;
              extraSpecialArgs = {
                inherit username dotconfig;
              };
            };
          }
          nix-flatpak.nixosModules.nix-flatpak
          {
            environment.systemPackages = [ alejandra.defaultPackage.${system} ];
          }
          {
            nixpkgs.overlays = [ inputs.millennium.overlays.default ];
          }
        ];
      };
    };
}
