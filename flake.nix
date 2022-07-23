{
  inputs = {
    nur = { url = "github:nix-community/NUR"; };

    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = { url = "github:NixOS/nixos-hardware/master"; };

    media = {
      url = "github:bmartynov/dotnix/media";
      flake = false;
    };

    nix-colors = { url = "github:misterio77/nix-colors"; };
  };

  outputs = { self, nixpkgs, home-manager, nix-colors, ... }@inputs:
    let
      pkgsFor = system:
        import inputs.nixpkgs {
          overlays = [ inputs.nur.overlay ];
          localSystem = { inherit system; };
          config = {
            allowUnfree = true;
            android_sdk.accept_license = true;
          };
        };

      mkSystem = system: name:
        let pkgs = pkgsFor system;
        in inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            (import (./machines + "/${name}") {
              inputs = inputs;
              lib = inputs.nixpkgs.lib;
              device = name;
              inherit pkgs;
            })
            { nixpkgs.pkgs = pkgs; }
          ];
          specialArgs = { inherit inputs; };
        };

      mkHome = system: username:
        home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsFor system;
          modules = [ ./profiles/${username}.nix ];
          extraSpecialArgs = { inherit inputs nix-colors; };
        };
    in {
      profiles = import ./profiles;

      # 
      legacyPackages.x86_64-linux = pkgsFor "x86_64-linux";

      # dev shell
      devShell.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux;
        mkShell { buildInputs = [ nixfmt ]; };

      nixosConfigurations = {
        borg = mkSystem "x86_64-linux" "borg";
        vulcan = mkSystem "x86_64-linux" "vulcan";
      };

      homeConfigurations = {
        boris = mkHome "x86_64-linux" "boris";
        alexandra = mkHome "x86_64-linux" "alexandra";
      };
    };
}
