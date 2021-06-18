{ pkgs, config, lib, inputs, ... }:
{
  # TODO: move
  # programs.dconf.enable = true;
  # services.dbus.packages = with pkgs; [ gnome3.dconf ];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita";
    };
    iconTheme = {
      name = "Obsidian-Gray";
    };
    gtk3 = {
      extraCss = ''
        window.ssd headerbar.titlebar {
            padding-top: 4px;
            padding-bottom: 4px;
            min-height: 0;
        }

        window.ssd headerbar.titlebar button.titlebutton {
            padding: 0px;
            min-height: 0;
            min-width: 0;
        }
      '';
      bookmarks = [
        "file:///home/boris/projects/c"
        "file:///home/boris/projects/ts"
        "file:///home/boris/projects/rust"
      ];
      extraConfig = {
        "gtk-cursor-theme-name" = "Breeze";
        "gtk-application-prefer-dark-theme" = true;
      };
    };
  };
}
