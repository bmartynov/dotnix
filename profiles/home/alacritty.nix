{ pkgs, config, lib, ... }:
with lib;
with pkgs.stdenv;
with config.colorscheme.colors;

{
  programs.alacritty = {
    enable = true;
    settings = {
      shell = { program = "tmux"; };
      font = { size = 14; };

      window = {
        opacity = 1;
        decorations = "none";
        gtk_theme_variant = "dark";
      };

      draw_bold_text_with_bright_colors = false;

      colors = {
        primary = {
          background = "#${base00}";
          foreground = "#${base05}";
        };
        cursor = {
          text = "#${base00}";
          cursor = "#${base05}";
        };
        normal = {
          black = "#${base00}";
          red = "#${base08}";
          green = "#${base0B}";
          yellow = "#${base0A}";
          blue = "#${base0D}";
          magenta = "#${base0E}";
          cyan = "#${base0C}";
          white = "#${base05}";
        };
        bright = {
          black = "#${base03}";
          red = "#${base09}";
          green = "#${base01}";
          yellow = "#${base02}";
          blue = "#${base04}";
          magenta = "#${base06}";
          cyan = "#${base0F}";
          white = "#${base07}";
        };
      };
    };
  };
}
