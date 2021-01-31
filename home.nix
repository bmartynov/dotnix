{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [ 
    ./modules/wm/sway

    ./modules/applications/git
    ./modules/applications/nvim
    ./modules/applications/rofi
    ./modules/applications/mako
    ./modules/applications/waybar
    ./modules/applications/vscode
    ./modules/applications/alacritty
    ./modules/applications/taskwarrior

    ./modules/tools/tmux
    ./modules/tools/htop
    ./modules/tools/starship

    ./modules/shells/zsh

    ./gtk.nix
    
    ./user-dirs.nix
    ./session_variables.nix

    ./fonts.nix
  ];

  services.blueman-applet.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "boris";
  home.homeDirectory = "/home/boris";

  home.packages = with pkgs; [
    brightnessctl
    tdesktop
    swaylock
    dconf

    keepassxc

    pavucontrol

    grim
    wf-recorder

    networkmanager
    networkmanager-openvpn

    firefox-bin
    jetbrains.goland
    jetbrains.clion
    

    google-chrome

    virt-manager

    graphviz

    xmind
    libreoffice

    dbeaver

    docker-compose
    
    # python stuff
    pipenv
    python38Full
    python38Packages.ipython
    python38Packages.pip
    python38Packages.pip-tools
    python38Packages.rope
    
    # go stuff
    go_1_15

    bat
    exa
    fd
    hyperfine
    ripgrep
    tokei

    redis-desktop-manager
    klavaro
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
