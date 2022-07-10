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

    inputs.self.profiles.workspace.gnome

    inputs.self.profiles.security.alexandra
  ];

  networking.hostName = "vulcan";

  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "Asia/Dubai";

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
