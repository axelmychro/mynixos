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
      hostname = "mychro";
    in
    {
      nixosConfigurations = {
        block = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit hostname username; };

          modules = [
            ./icing/block/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit username; };
                users.${username} = import ./icing/block/home.nix;
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ plasma-manager.homeModules.plasma-manager ];
                backupFileExtension = "backup";
              };
            }
            nix-flatpak.nixosModules.nix-flatpak
            {
              nixpkgs.overlays = [ inputs.millennium.overlays.default ];
            }
          ];
        };

        cube = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit hostname username; };

          modules = [
            ./icing/cube/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit username; };
                users.${username} = import ./icing/cube/home.nix;
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ plasma-manager.homeModules.plasma-manager ];
                backupFileExtension = "backup";
              };
            }
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };

        dice = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit hostname username; };

          modules = [
            ./icing/dice/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit username; };
                users.${username} = import ./icing/dice/home.nix;
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ plasma-manager.homeModules.plasma-manager ];
                backupFileExtension = "backup";
              };
            }
            nix-flatpak.nixosModules.nix-flatpak
            {
              nixpkgs.overlays = [ inputs.millennium.overlays.default ];
            }
          ];
        };
      };
      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
