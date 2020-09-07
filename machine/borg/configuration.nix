# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./t480s_tlp.nix
      ./t480s_undervolt.nix
    ];


  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;


  boot.kernelPackages = pkgs.linuxPackages_5_7;

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/0091dba4-522c-44db-a07a-43bff10d98dd";
      preLVM = true;
      allowDiscards = true;
    };
  };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;

  networking.hostName = "borg";
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    htop
    curl
    extundelete
  ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  hardware.opengl.enable = true;
  services.acpid.enable = true;

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  # Enable sound.
  # sound.enable = true;
  hardware.pulseaudio = {
    enable = true;

    package = pkgs.pulseaudioFull;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
    qemuRunAsRoot = false;
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.boris = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "docker"]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

