
{ config, pkgs, ... }:

{
    xdg.userDirs.enable = true;
    xdg.userDirs.download = "\$HOME/downloads";
    xdg.userDirs.desktop = "\$HOME/desktop";
    xdg.userDirs.documents = "\$HOME/documents";
    xdg.userDirs.music = "\$HOME/music";
    xdg.userDirs.pictures = "\$HOME/pictures";
    xdg.userDirs.publicShare = "\$HOME/public";
    xdg.userDirs.templates = "\$HOME/templates";
    xdg.userDirs.videos = "\$HOME/videos";
}