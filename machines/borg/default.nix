{ inputs, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      inputs.home-manager.nixosModules.home-manager

      inputs.self.system.nix
      inputs.self.system.nixpkgs
      inputs.self.system.hardware.intel
      inputs.self.system.hardware.tlp

      inputs.self.system.virtualisation.docker
      inputs.self.system.virtualisation.libvirtd

      inputs.self.system.gnome

      inputs.self.users.boris

      inputs.self.container.work
    ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.boris = inputs.self.profiles.boris;

  networking = {
    hostName = "borg";
    networkmanager.enable = true;
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

  services.fwupd.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.thermald.enable = true;
  services.upower.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}
