{ lib, inputs, ... }: {
  nix = rec {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      
      require-sigs = true;
      substituters = [ "https://cache.nixos.org" ];
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
    };


    nixPath = lib.mkForce [ "nixpkgs=/etc/nixpkgs" ];

    registry.self.flake = inputs.self;

    nrBuildUsers = 16;

    optimise.automatic = true;

    # garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  environment.etc.nixpkgs.source = inputs.nixpkgs;
  environment.etc.self.source = inputs.self;
}
