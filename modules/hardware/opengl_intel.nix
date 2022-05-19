{ pkgs, ... }: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      #vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
      (vaapiIntel.override { enableHybridCodec = true; })
    ];
  };

  environment.systemPackages = with pkgs; [
    glxinfo
    libglvnd
    mesa
    libva-utils
    mesa.drivers
    libGL
  ];
}
