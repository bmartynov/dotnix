{ config, pkgs, lib,  ... }:

with lib;
with builtins;

let 
    workspaces = import ./workspaces.nix {};
    applications = import ./applications.nix {};

    font = "Ubuntu Mono";
    internal_display = "eDP-1";
    external_display = "Goldstar Company Ltd LG HDR 4K 0x000007AD";
    wallpaper = "~/.local/share/wallpaper/thinkpad-t480s.png fill";

    startup = [ { command = applications.notification_daemon; } ];
    input = {"*" = {
        "xkb_layout" = "us,ru";
        "xkb_options" = "grp:caps_toggle,grp_led:caps";
    };};

    output = {
        "*" = { bg = wallpaper; };
        external_display = { mode = "2560x1440@60Hz"; };
    };

    bars = [{
        id = "bar-0";
        mode = "hide";
        fonts = ["${font} 12"];
    }];

    cfg = config.wayland.windowManager.sway.config;

    # dsl 
    mod             = k: cfg.modifier+"+${toString k}";
    modShift        = k: mod "Shift+${toString k}";
    modControl      = k: mod "Control+${toString k}";
    
    exec            = c: "exec ${c}";
    layout          = c: "layout ${c}";
    move            = c: "move ${c}";
    focus           = c: "focus ${c}";
    floating        = c: "floating ${c}";
    workspace       = n: "workspace ${toString n}";
    move_container  = w: "move container to workspace ${w}";

    # command gen
    merge = fold (x: y: x // y) {};
    workspace_switch = i: v: { ${mod i} = (workspace v); };
    workspace_move = i: v: { ${modShift i} = (move_container v); };
    workspace_binds = (merge (imap0 workspace_switch workspaces.all)) // 
                      (merge (imap0 workspace_move workspaces.all));
in {
    wayland.windowManager.sway.enable                   = true;
    wayland.windowManager.sway.config.modifier          = "Mod4";
    wayland.windowManager.sway.config.bindkeysToCode    = true;
    wayland.windowManager.sway.config.startup           = startup;
    wayland.windowManager.sway.config.input             = input;
    wayland.windowManager.sway.config.output            = output;
    wayland.windowManager.sway.config.assigns           = workspaces.assigns;
    wayland.windowManager.sway.config.fonts             = [ "${font} 12" ];
    wayland.windowManager.sway.config.bars              = bars;

    wayland.windowManager.sway.config.keybindings =  with cfg;  with applications; {
        # app launcher
        ${mod "F12"} = exec app_launcher;
        
        # lock screen
        ${modControl "l"} = exec lock;
        
        # terminal
        ${mod "Return"} = exec terminal;
        
        # kill focused window
        ${modShift "Q"} = "kill";
        
        # toggle tiling / floating
        ${modControl "space"} = floating "toggle"; 

        # enter fullscreen mode for the focused container
        ${mod "f"} = "fullscreen"; 

        # multimedia keys
        "XF86AudioMute"         =   exec volume_mute;
        "XF86AudioMicMute"      =   exec mic_mute;
        "XF86AudioRaiseVolume"  =   exec volume_raise;
        "XF86AudioLowerVolume"  =   exec volume_lower;
        "XF86MonBrightnessDown" =   exec brightness_lower;
        "XF86MonBrightnessUp"   =   exec brightness_raise;
        
        # orientation
        ${modControl "h"}       = layout "splith"; # horizontal orientation
        ${modControl "v"}       = layout "splitv"; # vertical orientation

        # container layout 
        ${mod "s"}              = layout "stacking";
        ${mod "w"}              = layout "tabbed";
        ${mod "v"}              = layout "vertical";
        ${mod "e"}              = layout "default";
        
        # move focused window
        ${modShift left}          = move "left";
        ${modShift down}          = move "down";
        ${modShift up}            = move "up";
        ${modShift right}         = move "right";
        
        # focus window       
        "${mod left}"               = focus "left";
        "${mod down}"               = focus "down";
        "${mod up}"                 = focus "up";
        "${mod right}"              = focus "right";
    } // workspace_binds;

    wayland.windowManager.sway.extraSessionCommands= ''
    export SDL_VIDEODRIVER=wayland
    # needs qt5.qtwayland in systemPackages
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    # Fix for some Java AWT applications (e.g. Android Studio),
    # use this if they aren't displayed properly:
    export _JAVA_AWT_WM_NONREPARENTING=1
    # firefox on wayland
    export MOZ_ENABLE_WAYLAND=1 firefox
    # gtk applications on wayland
    # export GDK_BACKEND=wayland
    '';

    wayland.windowManager.sway.extraConfig = with applications; ''
    # lock screen on lid open
    bindswitch lid:on exec ${lock}
    exec ${notification_daemon}
    '';
}
