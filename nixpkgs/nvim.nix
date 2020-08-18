{ config, pkgs, ... }:

{
    programs.neovim.enable = true;

    programs.neovim.withPython = false;
    programs.neovim.withRuby = false;
}