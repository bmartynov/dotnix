{ config, pkgs, lib, ...}:
{
    programs.waybar = {
        enable = true;
        settings = [
            {
                layer = "top";
                position = "top";
                height = 24;
                output = [
                    "eDP-1"
                ];
                modules-left = [ "sway/workspaces" "sway/mode" ];
                modules-center = [ "sway/window" ];
                modules-right = [ "cpu" "battery" "clock" "tray" ];
                modules = {
                    "sway/workspaces" = {
                        disable-scroll = true;
                        all-outputs = true;
                    };
                };
            }
        ];
    };

    wayland.windowManager.sway.config.bars = [
        { "command" = "${pkgs.waybar}/bin/waybar"; }
    ];
}