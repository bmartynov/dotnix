{ lib, inputs, ... }: {
  nix = rec {
    nixPath = lib.mkForce [ "nixpkgs=/etc/nixpkgs" ];
    binaryCaches = [ "https://cache.nixos.org" ];

    registry.self.flake = inputs.self;

    trustedUsers = [
      "root"
      "@wheel"
    ];

    nrBuildUsers = 16;

    optimise.automatic = true;

    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];

    # garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    package = inputs.nix.packages.x86_64-linux.nix;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    requireSignedBinaryCaches = true;
  };
  environment.etc.nixpkgs.source = inputs.nixpkgs;
}
