{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xorg.xprop
    gnome40Extensions."pixel-saver@deadalnix.me"
    gnome40Extensions."hidetopbar@mathieu.bidon.ca"
    gnomeExtensions.vitals
  ];
}
