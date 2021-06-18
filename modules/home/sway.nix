{ pkgs, lib, ... }:

with lib;
with builtins;

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      bindkeysToCode = true;
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
      keybindings = mkOptionDefault {
        # terminal
        "${modifier}+Return" =
          "exec ${pkgs.alacritty}/bin/alacritty";

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
      };
    };

    extraConfig = ''
      # lock screen on lid open
      bindswitch lid:on exec "${pkgs.swaylock}/bin/swaylock --color 000000"

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
