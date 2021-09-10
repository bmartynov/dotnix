{
  nix = {
    require = [ ./nix.nix ];
  };
  nixpkgs = {
    require = [ ./nixpkgs.nix ];
  };
  hardware = {
    intel = { pkgs, ... }: {
      require = [
        ./hardware/opengl_intel.nix
      ];
    };
    tlp = {
      require = [
        ./hardware/thinkpad/tlp.nix
      ];
    };
    audio = {
      hardware.pulseaudio.enable = false;

      services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
      };
    };
  };
  gnome = {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
  virtualisation = {
    libvirtd = {
      virtualisation.libvirtd = {
        enable = true;
        onBoot = "ignore";
        onShutdown = "shutdown";
      };
    };
    docker = {
      virtualisation.docker = {
        enable = true;
        enableOnBoot = false;
      };
    };
  };
}
