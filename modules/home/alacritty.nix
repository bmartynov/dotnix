{ pkgs, lib, ... }:
with lib;
with pkgs.stdenv;
let
  darwinOverride =
    {
      settings = {
        window = {
          decorations = "full";
          gtk_theme_variant = "None";
        };
      };
    };
in
{
  programs.alacritty =
    recursiveUpdate
      {
        enable = true;
        settings = {
          shell = {
            program = "tmux";
          };
          font = {
            size = 14;
          };
          window = {
            decorations = "none";
            gtk_theme_variant = "dark";
          };
          background_opacity = 1;
        };
      }
      (if isDarwin then darwinOverride else { });
}
