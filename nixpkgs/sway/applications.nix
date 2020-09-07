{}:
{
    lock = ''swaylock --color 000000'';
    terminal = ''alacritty'';
    app_launcher = ''rofi  -show combi window,run,ssh,combi -modi window,run,ssh,combi'';
    notification_daemon = ''mako'';
    # volume control
    mic_mute = ''pactl set-source-mute       @DEFAULT_SOURCE@    toggle'';
    volume_mute = ''pactl set-sink-mute      @DEFAULT_SINK@      toggle'';
    volume_raise = ''pactl set-sink-volume   @DEFAULT_SINK@      +5% '';
    volume_lower = ''pactl set-sink-volume   @DEFAULT_SINK@      -5% '';
    # brightness control
    brightness_raise = ''brightnessctl   set     +2%'';
    brightness_lower = ''brightnessctl   set     2%-'';

    waybar = "waybar";
}