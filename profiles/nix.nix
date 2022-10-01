{ lib, inputs, pkgs, ... }:
let
  inherit (pkgs.stdenv) isLinux isDarwin;

  gcLinux = {
    automatic = true;
    dates = "weekly";
  };

  gcDarwin = {
    automatic = true;
    interval = {
      Hour = 3;
      Minute = 15;
    };
  };

in {
  nix = rec {
    settings = {
      trusted-users = [ "root" "@wheel" ];

      require-sigs = true;
      substituters = [ "https://cache.nixos.org" ];
      trusted-public-keys =
        [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
    };

    nixPath = lib.mkForce [ "nixpkgs=/etc/nixpkgs" ];

    registry.self.flake = inputs.self;

    nrBuildUsers = 16;

    # garbage collection
    gc = {
      options = "--delete-older-than 7d";
    } // lib.optionalAttrs isLinux gcLinux
      // lib.optionalAttrs isDarwin gcDarwin;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  } // lib.optionalAttrs isLinux { optimise.automatic = true; };

  environment.etc.nixpkgs.source = inputs.nixpkgs;
  environment.etc.self.source = inputs.self;
}
