{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        withPython = false;
        withRuby = false;
    };
}