# /etc/nixos/flake.nix
{
  description = "flake for blake";

  inputs = {
    nixpkgs = {
      # url = "nixpkgs/nixos-24.11"
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixd.url = "github:nix-community/nixd";
  };

  outputs = { self, nixpkgs, home-manager, nixd, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      homeStateVersion = "24.11";
      user = "blake";
      hosts = [
        {
          hostname = "nixos";
          stateVersion = "24.11";
        }
      ];

      makeSystem = { hotname, stateVersion }: lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit inputs stateVersion hostname user;
        };

        modules = [
          ./hosts/${hostname}/configuration.nix
        ];
      };

    in {
      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
        configs // {
          "${host.hostname}" = makeSystem {
            inherit (host) hostname stateVersion;
          };
        }
      ) {} hosts;

      homeConfigurations.$(user) = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.$(system);
        extraSpecialArgs = {
          inherit inputs homeStateVersion user;
        };

        modules = [
          ./home-manager/home.nix
        ];
      };
    };
}
