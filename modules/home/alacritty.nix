{ pkgs, lib, ... }:
with lib;
with pkgs.stdenv;
let
  darwinOverride = {
    settings = {
      window = {
        decorations = "full";
        gtk_theme_variant = "None";
      };
    };
  };
in {
  programs.alacritty = recursiveUpdate {
    enable = true;
    settings = {
      shell = { program = "tmux"; };
      font = { size = 14; };
      window = {
        opacity = 1;
        decorations = "none";
        gtk_theme_variant = "dark";
      };
    };
  } (if isDarwin then darwinOverride else { });
}
