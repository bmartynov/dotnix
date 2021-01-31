{ config, pkgs, ... }:

{
    programs.htop.enable = true;
    programs.htop.showProgramPath = false;
    programs.htop.sortKey = "M_RESIDENT";
}