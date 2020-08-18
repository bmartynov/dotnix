{ config, pkgs, ... }:

{
    # vscode 
    programs.vscode.enable = true;
    programs.vscode.package = pkgs.vscodium;
    programs.vscode.extensions = [ 
        pkgs.vscode-extensions.bbenoist.Nix
        pkgs.vscode-extensions.ms-python.python
        pkgs.vscode-extensions.matklad.rust-analyzer
    ];
}