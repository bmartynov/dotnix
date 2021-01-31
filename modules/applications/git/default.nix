{ config, pkgs, ... }:

{
    programs.git.enable = true;

    programs.git.userName = "bmartynov";
    programs.git.userEmail = "boriska91m@gmail.com";

    programs.git.aliases = {
        "co" = "checkout";
        "s" = "status";
    };
}