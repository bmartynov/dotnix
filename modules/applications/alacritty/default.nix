{ config, pkgs, ... }:

{
    programs.alacritty.enable = true;
    programs.alacritty.settings = {
        shell = {
            program = "tmux";
        };
        font = {
            size = 12;
            normal = {
                family = "Ubuntu Mono";
            };
        };
        background_opacity = 1;
    };
}
