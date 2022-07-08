{ pkgs, ... }: {
  hardware.opengl.extraPackages = with pkgs; [
    # LIBVA_DRIVER_NAME=iHD
    intel-media-driver
    vaapiVdpau
    libvdpau-va-gl
    (vaapiIntel.override { enableHybridCodec = true; })
  ];

  environment.systemPackages = with pkgs; [
    glxinfo
    libglvnd
    mesa
    libva-utils
    mesa.drivers
    libGL
  ];
}
