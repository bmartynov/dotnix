{ pkgs, nix-colors, ... }: {
  require = [
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

    # workspace
    ./home/xdg.nix
    ./home/gtk.nix
    ./home/sway.nix
    ./home/fonts.nix
    ./home/firefox.nix

    # development
    ./home/git.nix
    ./home/vscode.nix

    nix-colors.homeManagerModule
  ];

  home.username = "boris";
  home.homeDirectory = "/home/boris";
  home.stateVersion = "22.05";

  colorscheme = nix-colors.colorSchemes.nord;

  home.packages = with pkgs; [
    bat
    exa
    fd
    hyperfine
    ripgrep
    tokei

    blueman

    easyeffects

    jq

    google-chrome

    networkmanagerapplet

    # workspace
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}