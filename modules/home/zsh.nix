{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;

    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "kubectl" ];
    };

    initExtra = ''
      function nix_run() { 
          nix run nixpkgs#$1 
      }
      
      function nix_shell() { 
          nix shell nixpkgs#$1 
      }
    '';
  };
}
