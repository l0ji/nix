{
  description = "Flake-ified racketeer config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      ...
    }@inputs:
    with inputs;
    {
      nixosConfigurations = {
        racketeer = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            system = "x86_64-linux";
          };
          modules = [
            lanzaboote.nixosModules.lanzaboote

            ./hosts/racketeer

            (
              { pkgs, lib, ... }:
              {
                environment.systemPackages = [
                  pkgs.sbctl
                ];

                boot.loader.systemd-boot.enable = lib.mkForce false;
                boot.lanzaboote = {
                  enable = true;
                  pkiBundle = "/var/lib/sbctl";
                };
              }
            )

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.backupFileExtension = "HMBackup";
              home-manager.users.penny = ./home/racketeer/home.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                system = "x86_64-linux";
              };
            }
          ];
        };
      };
    };
}
