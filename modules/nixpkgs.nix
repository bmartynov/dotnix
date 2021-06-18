{ inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    inputs.rust-overlay.overlay
    inputs.nur.overlay
  ];
}
