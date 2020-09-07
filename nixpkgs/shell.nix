{ config, pkgs, ... }:

{
    # zsh 
    programs.zsh.enable = true;
    programs.zsh.dotDir =  ".config/zsh";
    programs.zsh.enableAutosuggestions = true;

    programs.zsh.history = {
        path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
    programs.zsh.oh-my-zsh = {
        enable = true;
        plugins = ["git" "kubectl"];
        theme = "kardan";
    };

    # tmux 
    programs.tmux.enable = true;
    programs.tmux.baseIndex = 1;
    programs.tmux.keyMode = "vi";
    programs.tmux.newSession = true;
    programs.tmux.terminal = "screen-256color";
    programs.tmux.extraConfig = ''
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
bind-key r source-file ~/.tmux.conf \; display-message "config reloaded"
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
set-option -g status-justify left
set-option -g status-left-length 16
set-option -g status-bg colour237
set-option -g status-interval 60

## message text
set-option -g message-style bg=colour253,fg=colour232

## non active pane
set-window-option -g window-status-current-format '#[fg=colour232]#[bg=colour253] #I #[bg=colour235]#[fg=colour253] #[bg=colour234]#W#[bg=colour235]#[fg=colour195]#F#[bg=colour236] '

## non active pane
set-window-option -g window-status-format '#[fg=colour253]#[bg=colour0] #I #[bg=colour239]#[fg=colour253] #[bg=colour240]#W#[bg=colour239]#[fg=colour195]#F#[bg=colour238] '
    '';
}