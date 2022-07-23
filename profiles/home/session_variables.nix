{ config, ... }: {
  home.sessionVariables = {
    # home cleanup
    ## ipython config dir
    IPYTHONDIR = "${config.xdg.configHome}/ipython";

    ## bash_history file
    HISTFILE = "${config.xdg.dataHome}/bash/history";

    ## cargo home 
    CARGO_HOME = "${config.xdg.dataHome}/cargo";

    ## rustup
    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";

    ## gnupg
    GNUPGHOME = "${config.xdg.dataHome}/gnupg";

    ## less history file 
    "LESSHISTFILE" = "-";

    ## slack
    "NIXOS_OZONE_WL" = "1";
  };
}
