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
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./hosts/default/configuration.nix 
            ];
        };
        # workvm = lib.nixosSystem {
        #   inherit system;
        #   modules = [
        #     ./hosts/workvm/configuration.nix
        #   ];
        # };
      };
      homeConfigurations = {
        blake = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/default/home.nix ];
        };
      };
    };
}
