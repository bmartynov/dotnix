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
    ./home/gnome.nix
    ./home/fonts.nix
    ./home/firefox.nix

    # development
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

    easyeffects

    jq

    git

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

  # bookmarks
  gtk.gtk3.bookmarks = [
    "file:///home/boris/work"
    "file:///home/boris/projects"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
