{ inputs, lib, pkgs, device, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    inputs.self.profiles.nix
    inputs.self.profiles.boot
    inputs.self.profiles.sound
    inputs.self.profiles.docker
    inputs.self.profiles.libvirtd
    inputs.self.profiles.networking

    inputs.self.profiles.opengl
    inputs.self.profiles.hardware.t480s.tlp
    inputs.self.profiles.hardware.intel.gpu

    inputs.self.profiles.security.boris
  ];

  networking.hostName = "borg";

  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "Asia/Dubai";

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  environment.systemPackages = with pkgs; [ acpi qt5.qtwayland gparted ];

  xdg.portal = {
    enable = true;
    gtkUsePortal = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-wlr ];
  };

  programs.dconf.enable = true;
  services.dbus.packages = with pkgs; [ dconf ];
  programs.ssh.startAgent = true;

  services.fwupd.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.thermald.enable = true;
  services.upower.enable = true;
  services.gvfs.enable = true;
  services.udev.packages = [ pkgs.android-udev-rules ];

  # thinkpad t480s trackpoint issue (freezing)
  boot.kernelParams = [ "psmouse.elan_smbus=0" ];

  boot.blacklistedKernelModules = [ "i2c_i801" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}
