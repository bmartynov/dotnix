rec {
  terminal = { pkgs, ... }: rec {
    require = [
      ./home/zsh.nix
      ./home/lf.nix
      ./home/htop.nix
      ./home/tmux.nix
      ./home/direnv.nix
      ./home/starship.nix
      ./home/alacritty.nix
      ./home/session_variables.nix
    ];

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
      ./home/fonts.nix
      ./home/firefox.nix
      ./home/gnome.nix
    ];
    home.packages = with pkgs; [
      tdesktop
      keepassxc
    ];
  };

  development = rec {
    require = [
      ./home/git.nix
      ./home/vscode.nix
    ];
  };

  golang = { pkgs, ... }: rec {
    home.packages = with pkgs; [
      go
      golangci-lint
    ];
  };

  rust = { pkgs, ... }: rec {
    home.packages = with pkgs; [
      rust-bin.nightly.latest.rust
      rust-bin.nightly.latest.rust-src
    ];
  };

  virtualisation = {
    libvirtd = { pkgs, ... }: {
      home.packages = with pkgs; [
        virt-manager
        virt-viewer
      ];
    };
  };

  boris = {
    require = [
      terminal
      development
      rust
      golang
      workspace

      virtualisation.libvirtd
    ];
  };
}