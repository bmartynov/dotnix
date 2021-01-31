{ config, pkgs, ... }:

{
    wayland.windowManager.sway.config.startup = [
        { command = "${pkgs.mako}/bin/mako"; }
    ];
    
    programs.mako = {
        enable = true;
        font = "Ubuntu Mono 12";
        borderColor = "#dddddd";
        backgroundColor = "#000000";
        progressColor = "#444444";
        width = 400;
        padding = "20";
        borderSize = 3;
        defaultTimeout = 3000; # ms
    };
}