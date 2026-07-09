{
  description = "Flake-ified racketeer config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    nixpkgs-discord-krisp = {
      url = "github:samschlegel/nixpkgs/samschlegel/use-fhsenv-for-discord-linux";
      flake = false;
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
              home-manager.backupFileExtension = "HMBackup";
              home-manager.users.penny = {
                imports = [
                  ./home/racketeer/home.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
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
