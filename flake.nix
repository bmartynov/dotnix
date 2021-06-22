{
  inputs = {
    nur = {
      url = github:nix-community/NUR;
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:nix-community/home-manager/master";
    };
    rust-overlay = {
      inputs.nixpkgs.follows = "nixpkgs";

      url = "github:oxalica/rust-overlay";
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
      golang = {
        path = ./templates/golang;
        description = "Golang flake";
      };
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
