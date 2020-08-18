{ config, pkgs, ... }:

{
    programs.mako.enable = true;

    programs.mako.font = "Ubuntu Mono 12";

    programs.mako.borderColor = "#dddddd";
    programs.mako.backgroundColor = "#000000";
    programs.mako.progressColor = "#444444";

    programs.mako.width = 400;
    programs.mako.padding = "20";
    programs.mako.borderSize = 3;

    programs.mako.defaultTimeout = 3000; # ms

}