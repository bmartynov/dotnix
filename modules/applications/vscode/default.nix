{ config, pkgs, ... }:
{
    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
        extensions = [ 
            pkgs.vscode-extensions.bbenoist.Nix
        ];
    };
}
