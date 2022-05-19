{
  nix = { require = [ ./nix.nix ]; };
  nixpkgs = { require = [ ./nixpkgs.nix ]; };
  hardware = {
    intel = { pkgs, ... }: { require = [ ./hardware/opengl_intel.nix ]; };
    tlp = { require = [ ./hardware/thinkpad/tlp.nix ]; };
    audio = {
      hardware.pulseaudio.enable = false;
      hardware.bluetooth.enable = true;

      services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
        wireplumber.enable = true;
        config.pipewire = { "support.dbus" = true; };
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
  tuigreet = { pkgs, ... }: {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
          user = "greeter";
        };
      };
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
