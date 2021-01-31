{ config, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        dotDir = ".config/zsh";
        enableAutosuggestions = true;
        
        history = {
            path = "${config.xdg.cacheHome}/zsh/zsh_history";
        };

        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = ["git" "kubectl"];
        };

        shellAliases = {
            "cat"   = "bat";
            "ls"    = "exa";
        };
    };
}
