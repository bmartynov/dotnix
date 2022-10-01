{ lib, stdenv, pkgs, nix-colors, ... }:
with pkgs.stdenv;

let
  homeDirectory = user: if isDarwin then "/Users/${user}" else "/home/${user}";

in rec {
  imports = [
    # terminal
    ./home/zsh.nix
    ./home/ssh.nix
    ./home/lf.nix
    ./home/htop.nix
    ./home/tmux.nix
    ./home/direnv.nix
    ./home/starship.nix
    ./home/alacritty.nix
    ./home/session_variables.nix

    # linux specific
    # ./home/xdg.nix
    # ./home/vscode.nix
    # ./home/firefox.nix

    # ./home/firefox.nix

    nix-colors.homeManagerModule
  ];

  # linux specific
  # ++ lib.optionals pkgs.stdenv.isLinux [
  # development
  #  

  # workspace
  #  
  #  ./home/gtk.nix
  #  ./home/sway.nix
  #  ./home/gnome.nix
  #  ./home/fonts.nix
  #  
  #];

  home.username = "boris";
  home.homeDirectory = homeDirectory home.username;
  home.stateVersion = "22.05";

  colorscheme = nix-colors.colorSchemes.nord;

  home.packages = with pkgs;
    [
      jq

      git

      bat
      exa
      fd

      gh

      hyperfine
      ripgrep
      tokei

      # kube
      kubectl

      docker-compose

      # linux specific
    ] ++ lib.optionals isLinux [
      easyeffects
      google-chrome

      workspace
      slack
      tdesktop
      keepassxc

      dconf

      transmission-gtk

      wireshark

      anydesk

      libreoffice

      # development
      pkgs.jetbrains.goland
      pkgs.jetbrains.idea-community
    ];

  programs.zsh.shellAliases = {
    "cat" = "bat";
    "ls" = "exa";
  };

  # bookmarks
  # gtk.gtk3.bookmarks = [ "file:///home/boris/work" "file:///home/boris/projects" ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
