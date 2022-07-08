{ pkgs, ... }: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    package = pkgs.mesa_drivers;
  };
}
