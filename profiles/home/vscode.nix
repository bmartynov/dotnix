{ pkgs, ... }:

let
  extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "Go";
      publisher = "golang";
      version = "0.32.0";
      sha256 = "sha256-OsKeZrG157l1HUCDvymJ3ovLxlEEJf7RBe2hXOutdyg=";
    }
    {
      name = "vscode-direnv";
      publisher = "Rubymaniac";
      version = "0.0.2";
      sha256 = "sha256-TVvjKdKXeExpnyUh+fDPl+eSdlQzh7lt8xSfw1YgtL4=";
    }
    {
      name = "intellij-idea-keybindings";
      publisher = "k--kato";
      version = "1.4.5";
      sha256 = "sha256-3QTl/OUPlLj9U4clOAIEMlS9xdSIwZogf+ViYv3dfHE=";
    }
    {
      name = "vscode-typescript-next";
      publisher = "ms-vscode";
      version = "4.4.20210715";
      sha256 = "sha256-fs3PErx2LV0PyaVInbZUzp5lsG2Q87te/Qc0JSb6+b0=";
    }
  ];
in {
  programs.vscode = {
    enable = pkgs.stdenv.isLinux;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions;
      [
        # pkgs.vscode-extensions.bbenoist.Nix
        # ms-python.python
        pkgs.vscode-extensions.matklad.rust-analyzer
      ] ++ extensions;
  };
}
