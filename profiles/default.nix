{
  nix = ./nix.nix;
  boot = ./boot.nix;
  sound = ./sound.nix;
  opengl = ./opengl.nix;
  docker = ./docker.nix;
  libvirtd = ./libvirtd.nix;
  networking = ./networking.nix;

  hardware = {
    t480s = { tlp = ./hardware/t480s/tlp.nix; };
    intel = { gpu = ./hardware/intel/gpu.nix; };
  };

  workspace = { gnome = ./workspace/gnome.nix; };

  security = import ./security.nix;
  users_staff = import ./users_staff.nix;
}
