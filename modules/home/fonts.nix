{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    iosevka
    corefonts
    dejavu_fonts
    ubuntu_font_family
    hack-font

    roboto
    powerline-fonts
    powerline-symbols
    font-awesome
    source-code-pro
    source-sans-pro
    source-serif-pro
    font-awesome_5
  ];
}
