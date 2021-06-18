{ pkgs, config, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    fira-code
    font-awesome_5
    hack-font
    hasklig
    ibm-plex
    inconsolata
    iosevka
    jetbrains-mono
    material-design-icons
    material-icons
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    ubuntu_font_family
  ];
}
