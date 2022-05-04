{ pkgs, ... }: {
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver
      (vaapiIntel.override { enableHybridCodec = true; })
    ];
  };

  environment.systemPackages = with pkgs; [ 
    glxinfo
    libglvnd
    mesa
    libva-utils
  ];
}
