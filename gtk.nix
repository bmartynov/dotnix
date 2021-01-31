{ config, pkgs, ... }:

{
    gtk.enable = true;
    gtk.theme = {
        name = "Obsidian-2";
        package = pkgs.theme-obsidian2;
    };
    gtk.iconTheme = {
        name = "Obsidian-Gray";
        package = pkgs.iconpack-obsidian;
    };

    gtk.gtk3 = {
        extraConfig = {
            "gtk-application-prefer-dark-theme" = true;
        };
        bookmarks = [
             "file:///home/boris/work"
             "file:///home/boris/projects"
        ];
    };
}