{ inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [ inputs.nur.overlay ];
}
