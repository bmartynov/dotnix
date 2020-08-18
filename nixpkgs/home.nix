{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [ 
    ./alacritty.nix 
    ./sway/sway.nix 
    ./shell.nix
    ./ide.nix
    ./htop.nix
    ./mako.nix
    ./gtk.nix
    ./rofi.nix
    ./nvim.nix
    ./git.nix

    ./user-dirs.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  fonts.fontconfig.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "boris";
  home.homeDirectory = "/home/boris";
  home.packages = with pkgs; [
    brightnessctl
    tdesktop
    slack
    swaylock
    dconf
    
    grim
    wf-recorder

    networkmanager
    networkmanager-openvpn
    firefox
    jetbrains.goland

    virt-manager

    graphviz

    # fonts
    hack-font
    fira-code
    ubuntu_font_family
    inconsolata
    noto-fonts
    noto-fonts-emoji
    iosevka
    jetbrains-mono
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}