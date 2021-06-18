{ lib, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$nix_shell"
        "$directory"
        "$character"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_status"
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "->";
        error_symbol = "-x";
      };
      nix_shell = {
        impure_msg = "[impure](bold red)";
        pure_msg = "[pure](bold green)";
        format = "[$symbol$state]($style) ";
      };
    };
  };
}
