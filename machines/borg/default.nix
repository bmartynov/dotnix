{ inputs, pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    inputs.self.system.nix
    inputs.self.system.nixpkgs
    inputs.self.system.hardware.intel
    inputs.self.system.hardware.tlp
    inputs.self.system.hardware.audio

    inputs.self.system.virtualisation.docker
    inputs.self.system.virtualisation.libvirtd

    # inputs.self.system.gnome

    inputs.self.users.boris
  ];

  networking = {
    hostName = "borg";
    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      wifi = { backend = "iwd"; };
    };
    firewall = { enable = true; };
  };

  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "Europe/Moscow";

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    initrd = {
      luks.devices = {
        root = {
          device = "/dev/disk/by-uuid/0091dba4-522c-44db-a07a-43bff10d98dd";
          preLVM = true;
          allowDiscards = true;
        };
      };
    };

    loader = {
      grub = {
        enable = true;
        version = 2;
        device = "nodev";
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  # trackpoint issue: freeze
  boot.kernelParams = [ "psmouse.elan_smbus=0" ];
  boot.blacklistedKernelModules = [ "i2c_i801" ];

  programs.ssh.startAgent = true;

  services.fwupd.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # TODO: enable later
  services.thermald.enable = false;
  services.upower.enable = true;
  services.gvfs.enable = true;
  services.udev.packages = [ pkgs.android-udev-rules ];

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  environment.systemPackages = with pkgs; [ acpi ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}
