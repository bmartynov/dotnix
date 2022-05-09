rec {
  terminal = { pkgs, nix-colors, ... }: rec {
    require = [
      ./home/zsh.nix
      ./home/ssh.nix
      ./home/lf.nix
      ./home/htop.nix
      ./home/tmux.nix
      ./home/direnv.nix
      ./home/starship.nix
      ./home/alacritty.nix
      ./home/session_variables.nix

      ./mprofiles.nix
    ];

    imports = [
      nix-colors.homeManagerModule
    ];

    colorscheme = nix-colors.colorSchemes.tokyo-city-light;

    home.packages = with pkgs; [
      bat
      exa
      fd
      hyperfine
      ripgrep
      tokei

      jq

      google-chrome
    ];

    programs.zsh.shellAliases = {
      "cat" = "bat";
      "ls" = "exa";
    };
  };

  workspace = { pkgs, ... }: rec {
    require = [
      ./home/xdg.nix
      ./home/gtk.nix
      ./home/sway.nix
      ./home/fonts.nix
      ./home/firefox.nix
    ];

    home.packages = with pkgs; [
      slack
      tdesktop
      keepassxc

      dconf

      transmission-gtk

      wireshark

      libreoffice
    ];
  };

  development = { pkgs, ... }: rec {
    require = [ 
      ./home/git.nix 
      ./home/vscode.nix 
    ];

    home.packages = with pkgs; [ 
      jetbrains.goland
      jetbrains.idea-community
    ];
  };

  virtualisation = {
    libvirtd = { pkgs, ... }: {
      home.packages = with pkgs; [ virt-manager virt-viewer ];
    };
  };

  boris = {
    require = [
      terminal
      development
      workspace

      virtualisation.libvirtd
    ];
  };
}
