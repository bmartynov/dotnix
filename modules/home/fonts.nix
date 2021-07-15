{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    fira-code
    hack-font
    ibm-plex
    nerdfonts
    material-icons
    material-design-icons

    ubuntu_font_family
    noto-fonts
    noto-fonts-emoji
  ];
}
