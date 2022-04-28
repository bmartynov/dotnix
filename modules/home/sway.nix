{ pkgs, config, lib, inputs, ... }:

with lib;
with builtins;
with config.colorscheme.colors;

{
  home.packages = with pkgs; [
    gtk-engine-murrine
    gtk_engines
    gsettings-desktop-schemas
    lxappearance

    slack

    # screenshots
    slurp
    grim
    wl-clipboard
  ];

  programs.mako = {
    enable = true;
    # on top of fullscreen apps
    layer = "overlay";
    width = 400;
    padding = "20";
    borderSize = 3;
    defaultTimeout = 3000; # ms

    font = "Iosevka 14";
    borderRadius = 5;
    textColor = "#${base05}";
    borderColor = "#${base01}";
    progressColor = "#${base05}";
    backgroundColor = "#${base02}";
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
          names = [ "Iosevka" ];
          size = 14.0;
        };
      }];

      window = { titlebar = false; };

      input = {
        "*" = {
          "xkb_layout" = "us,ru";
          "xkb_options" = "grp:caps_toggle,grp_led:caps";
        };
        "2:14:ETPS/2_Elantech_Touchpad" = {
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

      keybindings = mkOptionDefault {
        # terminal
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";

        # terminal
        "${modifier}+Control+L" =
          "exec ${pkgs.swaylock}/bin/swaylock --color 000000";

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

        "--release Print" = ''
          exec grim -g "$(slurp)" ~/pictures/scr_`date +%Y%m%d.%H.%M.%S`.png'';
      };
    };

    extraConfig = ''
      # lock screen on lid open
      bindswitch lid:on exec "${pkgs.swaylock}/bin/swaylock --color 000000"

      exec ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1

      default_border pixel 1
      hide_edge_borders --i3 smart
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
