{ pkgs, config, lib, inputs, ... }:

with lib;
with builtins;
with config.colorscheme.colors;

let
  cfg = config.wayland.windowManager.sway.config;

  # dsl 
  mod = k: cfg.modifier + "+${toString k}";
  modShift = k: mod "Shift+${toString k}";
  modControl = k: mod "Control+${toString k}";

  exec = c: "exec ${c}";
  move = c: "move ${c}";
  layout = c: "layout ${c}";
  focus = c: "focus ${c}";
  floating = c: "floating ${c}";
  workspace = n: "workspace ${toString n}";
  move_container = w: "move container to workspace ${w}";

  # apps
  lock = "${pkgs.swaylock}/bin/swaylock --color 000000";

in {
  home.packages = with pkgs; [
    gtk-engine-murrine
    gtk_engines
    gsettings-desktop-schemas

    # screenshots
    slurp
    grim
    wl-clipboard
    xdg-utils
  ];

  programs.mako = {
    enable = true;
    # on top of fullscreen apps
    layer = "overlay";
    width = 400;
    padding = "20";
    borderSize = 1;
    defaultTimeout = 3000; # ms

    # font = "Iosevka 14";
    borderRadius = 5;

    extraConfig = ''
      background-color=#${base00}
      text-color=#${base05}
      border-color=#${base0D}

      [urgency=low]
      background-color=#${base00}
      text-color=#${base0A}
      border-color=#${base0D}

      [urgency=high]
      background-color=#${base00}
      text-color=#${base08}
      border-color=#${base0D}
    '';
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      bindkeysToCode = true;

      startup = [
        { command = "${pkgs.mako}/bin/mako"; }
        {
          command =
            "dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY DBUS_SESSION_BUS_ADDRESS SWAYSOCK XDG_SESSION_TYPE XDG_SESSION_DESKTOP XDG_CURRENT_DESKTOP";
        } # workaround
      ];

      gaps = { smartBorders = "on"; };

      bars = [{
        statusCommand =
          "/home/boris/projects/rust/i3status-tokio/target/debug/i3status-tokio";
        fonts = {
          # names = [ "Iosevka" ];
          size = 12.0;
        };

        colors = {
          background = base00;
          separator = base03;
          statusline = base04;

          focusedWorkspace = {
            text = base00;
            border = base05;
            background = base0C;
          };
          activeWorkspace = {
            text = base00;
            border = base05;
            background = base03;
          };
          inactiveWorkspace = {
            text = base05;
            border = base03;
            background = base01;
          };
          urgentWorkspace = {
            text = base00;
            border = base08;
            background = base08;
          };
          bindingMode = {
            text = base00;
            border = base00;
            background = base0A;
          };
        };
      }];

      colors = rec {
        background = base07;
        focused = {
          border = base05;
          background = base0D;
          text = base00;
          indicator = base0D;
          childBorder = base0D;
        };
        focusedInactive = {
          border = base01;
          background = base01;
          text = base05;
          indicator = base03;
          childBorder = base01;
        };
        unfocused = {
          text = base01;
          border = base00;
          background = base05;
          childBorder = base01;
          indicator = base01;
        };
        urgent = {
          text = base08;
          border = base08;
          background = base00;
          childBorder = base08;
          indicator = base08;
        };
        placeholder = {
          text = base00;
          border = base00;
          background = base05;
          childBorder = base00;
          indicator = base00;
        };
      };

      window = { titlebar = false; };

      input = {
        "*" = {
          "xkb_layout" = "us,ru";
          "xkb_options" = "grp:caps_toggle,grp_led:caps";
        };
        "type:touchpad" = {
          tap = "enabled";
          dwt = "enabled";
          natural_scroll = "enabled";
        };
      };

      output = {
        "*" = {
          bg = "${inputs.media}/wallpapers/nix-wallpaper-dracula.png fill";
        };
      };

      keybindings = with cfg;
        mkOptionDefault {
          ${mod "d"} = "exec ${cfg.menu}";

          # terminal
          ${mod "Return"} = "exec ${pkgs.alacritty}/bin/alacritty";

          # terminal
          ${modControl "L"} = "exec ${lock}";

          # multimedia keys
          "XF86AudioMute" =
            "exec ${pkgs.pulseaudioFull}/bin/pactl set-sink-mute     @DEFAULT_SINK@      toggle";

          "XF86AudioMicMute" =
            "exec ${pkgs.pulseaudioFull}/bin/pactl set-source-mute   @DEFAULT_SOURCE@    toggle";

          "XF86AudioRaiseVolume" =
            "exec ${pkgs.pulseaudioFull}/bin/pactl set-sink-volume   @DEFAULT_SINK@      +5% ";

          "XF86AudioLowerVolume" =
            "exec ${pkgs.pulseaudioFull}/bin/pactl set-sink-volume   @DEFAULT_SINK@      -5% ";

          "XF86MonBrightnessDown" =
            "exec ${pkgs.brightnessctl}/bin/brightnessctl   set     2%-";

          "XF86MonBrightnessUp" =
            "exec ${pkgs.brightnessctl}/bin/brightnessctl   set     +2%";

          "--release Print" = "exec slurp | grim -g - - | wl-copy";
          "--release ${modifier}+Print" = ''
            exec grim -g "$(slurp)" ~/pictures/scr_`date +%Y%m%d.%H.%M.%S`.png'';
        };
    };

    extraConfig = ''
      # lock screen on lid open
      bindswitch lid:on exec ${lock}

      exec ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1

      default_border pixel 1
      hide_edge_borders --i3 smart

      workspace_auto_back_and_forth yes
    '';

    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      # needs qt5.qtwayland in systemPackages
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      # Fix for some Java AWT applications (e.g. Android Studio),
      # use this if they aren't displayed properly:
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
  };
}
