{ config, ... }:

with config.colorscheme.colors;

let
  extraConfig = ''
    ## renumber windows, if closed
    set-option -g renumber-windows on

    ## enable activity alerts
    setw -g monitor-activity on
    set -g visual-activity on

    # keys
    ## prefix
    set -g prefix `

    ## copypaste mode VI
    set-window-option -g mode-keys vi
    set -g status-keys vi

    ## misc
    bind-key r source-file ~/.config/tmux/tmux.conf \; display-message "config reloaded"
    bind-key a send-keys `
    bind-key X kill-pane
    bind-key K confirm-before kill-window

    ## windows
    bind-key H split-window -h
    bind-key V split-window -v
    bind-key N rotate-window -U
    bind-key P rotate-window -D

    ## pane
    bind-key j select-pane -D
    bind-key k select-pane -U
    bind-key h select-pane -L
    bind-key l select-pane -R
    bind-key F swap-pane -U
    bind-key D swap-pane -D

    # decoration
    # default statusbar colors
    set-option -g status-style "fg=#${base04},bg=#${base01}"

    # default window title colors
    set-window-option -g window-status-style "fg=#${base04},bg=default"

    # active window title colors
    set-window-option -g window-status-current-style "fg=#${base0A},bg=default"

    # pane border
    set-option -g pane-border-style "fg=#${base01}"
    set-option -g pane-active-border-style "fg=#${base02}"

    # message text
    set-option -g message-style "fg=#${base05},bg=#${base01}"

    # pane number display
    set-option -g display-panes-active-colour "#${base0B}"
    set-option -g display-panes-colour "#${base0A}"

    # clock
    set-window-option -g clock-mode-colour "#${base0B}"

    # copy mode highligh
    set-window-option -g mode-style "fg=#${base04},bg=#${base02}"

    # bell
    set-window-option -g window-status-bell-style "fg=#${base01},bg=#${base08}"
  '';
in {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    newSession = true;
    terminal = "screen-256color";
    extraConfig = extraConfig;
  };
}
