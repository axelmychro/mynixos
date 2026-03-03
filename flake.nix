{
  description = "Like a phoe-nix, cry and rise up from the ash!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
  };

  outputs =
    {
      nixpkgs,
      silentSDDM,
      home-manager,
      plasma-manager,
      nix-flatpak,
      zen-browser,
      millennium,
      spicetify-nix,
      aagl,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      zenPkgs = zen-browser.packages.${system};
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      nixosConfigurations.mychro = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit zenPkgs spicePkgs aagl; };

        modules = [
          ./system/configuration.nix
          ./user/axel/index.nix

          silentSDDM.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.axel = import ./user/axel/home-manager/home.nix;
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [ plasma-manager.homeModules.plasma-manager ];
              backupFileExtension = "backup";
            };
          }
          nix-flatpak.nixosModules.nix-flatpak
          { nixpkgs.overlays = [ millennium.overlays.default ]; }
          aagl.nixosModules.default
          spicetify-nix.nixosModules.default
        ];
      };
    };
}
