{ config, pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        location = "top-left";
        terminal = "alacritty";
        theme = "paper-float";
    };
}