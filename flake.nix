{
  description = "flake for blake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11";
    hardware.url = "github:nixos/nixos-hardware";
    catppuccin.url = "github:catppuccin/nix";
    sops-nix.url = "github:Mic92/sops-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = { 
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
      };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self,
    nixpkgs,
    home-manager,
    firefox-addons,
    darwin,
    catppuccin,
    sops-nix,
    ...
  } @ inputs: let
    inherit (self) outputs;

    # User configuration
    users = {
      blake = {
        name = "blake";
        email = "bh.nixos@iasus.io";
      };
    };

    makeNixosConfig = hostname: username:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs hostname;
          userConfig = users.${username};
          nixosModules = "${self}/modules/nixos";
        };
        modules = [./hosts/${hostname}];
      };

    makeDarwinConfig = hostname: username:
      darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {
          inherit inputs outputs hostname;
          userConfig = users.${username};
        };
        modules = [
          ./hosts/${hostname}
          home-manager.darwinModules.home-manager
        ];
      };

    makeHomeConfig = system: desktop: username:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {inherit system;};
        extraSpecialArgs = {
          inherit inputs outputs;
          userConfig = users.${username};
          nhModules = "${self}/modules/home-manager";
        };
        modules = [
          ./home/${desktop}
          catppuccin.homeModules.catppuccin
        ];
      };

  in {
    nixosConfigurations = {
      nixvm = makeNixosConfig "nixvm" "blake";
    };

    darwinConfigurations = {
      # nixmac = makeDarwinConfig "nixmac" "blake";
    };

    homeConfigurations = {
      "nixvm" = makeHomeConfig "x86_64-linux" "gnome" "blake";
      # "nixmac" = makeHomeConfig "aarch64-darwin" "macos" "blake";
    };

    overlays = import ./overlays {inherit inputs;};

  };
}
