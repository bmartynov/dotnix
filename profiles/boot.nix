{ lib, pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_latest;


  boot.loader.systemd-boot.enable = true;

  #boot.loader = {
  #  grub = {
  #    enable = true;
  #    version = 2;
  #    device = "nodev";
  #    efiSupport = true;
  #  };
  #  efi.canTouchEfiVariables = true;
  #};
}
