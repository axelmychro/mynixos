{
  description = "my chemical rebuild";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-flatpak,
      alejandra,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      dotconfig = ./home-manager/dotconfig;
    in
    {
      nixosConfigurations.mychro = nixpkgs.lib.nixosSystem {
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.axel = ./home-manager/axel.nix;
              extraSpecialArgs = {
                inherit dotconfig;
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
