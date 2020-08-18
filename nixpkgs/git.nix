{ config, pkgs, ... }:

{
    programs.git.enable = true;

    programs.git.userName = "bmartynov";
    programs.git.userEmail = "boriska91m@gmail.com";

    # programs.git.extraConfig = {
    #     editor = "nvim";
    #     browser = "firefox";
    # };
    
    programs.git.aliases = {
        "co" = "checkout";
        "S" = "status";
    };
}