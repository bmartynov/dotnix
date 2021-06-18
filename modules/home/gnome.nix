{ pkgs, ... }:
{
  # services.xserver = {
  #   enable = true;
  #   displayManager.gdm.enable = true;
  #   desktopManager.gnome.enable = true;
  # };

  home.packages = with pkgs; [
    xorg.xprop
    gnome40Extensions."pixel-saver@deadalnix.me"
    gnome40Extensions."hidetopbar@mathieu.bidon.ca"
  ];
}
