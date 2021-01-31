{ pkgs, ... }:
{
    lock = "${pkgs.swaylock}/bin/swaylock --color 000000";
    terminal = "${pkgs.alacritty}/bin/alacritty";
    app_launcher = "${pkgs.rofi}/bin/rofi  -show combi window,run,ssh,combi -modi window,run,ssh,combi";
    # volume control
    mic_mute = "${pkgs.pulseaudioFull}/bin/pactl set-source-mute       @DEFAULT_SOURCE@    toggle";
    volume_mute = "${pkgs.pulseaudioFull}/bin/pactl set-sink-mute      @DEFAULT_SINK@      toggle";
    volume_raise = "${pkgs.pulseaudioFull}/bin/pactl set-sink-volume   @DEFAULT_SINK@      +5% ";
    volume_lower = "${pkgs.pulseaudioFull}/bin/pactl set-sink-volume   @DEFAULT_SINK@      -5% ";
    # brightness control
    brightness_raise = "${pkgs.brightnessctl}/bin/brightnessctl   set     +2%";
    brightness_lower = "${pkgs.brightnessctl}/bin/brightnessctl   set     2%-";
}