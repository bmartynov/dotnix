{
  inputs = {
    nur = {
      url = github:nix-community/NUR;
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
    };
    nixos-hardware = {
      url = github:NixOS/nixos-hardware/master;
    };
  };

  outputs = { self, nix, nur, ... }@inputs: {
    users = import ./modules/users.nix;
    system = import ./modules/system.nix;
    profiles = import ./modules/profiles.nix;

    templates = {
      js = { path = ./templates/js; description = "JS"; };
      go = { path = ./templates/golang; description = "Golang"; };
      rust = { path = ./templates/rust; description = "Rust"; };
    };

    nixosConfigurations = with inputs.nixpkgs.lib;
      let
        mkSystem =
          name:
          system:
          nixosSystem {
            system = system;
            modules = [ (import (./machines + "/${name}")) ];
            specialArgs = { inherit inputs; };
          };
      in
      {
        borg = mkSystem "borg" "x86_64-linux";
        vulcan = mkSystem "vulcan" "x86_64-linux";
      };
  };
}
