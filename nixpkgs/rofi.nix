{ config, pkgs, ... }:

{
    programs.rofi.enable = true;
    programs.rofi.location = "top-left";
    programs.rofi.terminal = "alacritty";
    programs.rofi.theme = "dmenu";
}