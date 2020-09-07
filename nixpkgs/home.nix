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
    ./session_variables.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  fonts.fontconfig.enable = true;

  services.blueman-applet.enable = true;

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

    keepassxc

    pavucontrol

    grim
    wf-recorder

    networkmanager
    networkmanager-openvpn
    firefox
    jetbrains.goland


    google-chrome

    virt-manager

    graphviz

    xmind
    libreoffice
    
    gcc10
    pkg-config
    openssl
    cmake
    zlib
    pkgconfig

    # python stuff
    pipenv
    python38Full
    python38Packages.ipython
    python38Packages.pip
    python38Packages.pip-tools
    python38Packages.rope
    
    # go stuff
    go_1_15

    # rust stuff
    rustup

    bat
    exa
    fd
    hyperfine
    ripgrep
    tokei

    # fonts
    hack-font
    fira-code
    ubuntu_font_family
    inconsolata
    noto-fonts
    noto-fonts-emoji
    iosevka
    jetbrains-mono
    font-awesome_5



    redis-desktop-manager
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
