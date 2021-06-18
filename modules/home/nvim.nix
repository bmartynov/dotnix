{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withRuby = false;
  };
}
