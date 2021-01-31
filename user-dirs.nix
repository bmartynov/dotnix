
{ config, pkgs, ... }:

{
    xdg.userDirs = {
        enable = true;
        download = "\$HOME/downloads";
        desktop = "\$HOME/desktop";
        documents = "\$HOME/documents";
        music = "\$HOME/music";
        pictures = "\$HOME/pictures";
        publicShare = "\$HOME/public";
        templates = "\$HOME/templates";
        videos = "\$HOME/videos";
    };
}