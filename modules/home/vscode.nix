{ config, pkgs, ... }:

let extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "Go";
    publisher = "golang";
    version = "0.22.1";
    sha256 = "sha256-VKwKS091nEP0f6i/Mx5/1Kw45mejhERU/F+4WN8Ia70=";
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
    version = "1.3.0";
    sha256 = "sha256-/IbcMBDflO+5+m9LzJCwI0NOmkbockgXzdjp/43Emis=";
  }
  {
    name = "vscode-typescript-next";
    publisher = "ms-vscode";
    version = "4.3.20210223";
    sha256 = "sha256-UeQKPPygNN7+cTLflW+ho9WfjUUa08vp4DN9NR3FGMc=";
  }
];
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = [
      pkgs.vscode-extensions.bbenoist.Nix
      pkgs.vscode-extensions.matklad.rust-analyzer
    ] ++ extensions;
  };
}
