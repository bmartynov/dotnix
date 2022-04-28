{ pkgs, ... }: {
  home.packages = with pkgs; [
    nordic
    arc-theme
    gruvbox-dark-gtk
    graphite-gtk-theme

    gnome.gnome-themes-extra

    gtk-engine-murrine

    gnome40Extensions."unite@hardpixel.eu"
    gnome40Extensions."Vitals@CoreCoding.com"
  ];
}
