{ config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "tmux";
      };
      font = {
        size = 14;
        normal = {
          family = "Ubuntu Mono";
        };
      };
      background_opacity = 1;
      window = {
        # decorations = "none";
        gtk_theme_variant = "None";
      };
    };
  };
}
