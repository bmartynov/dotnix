{ config, ... }: {
  gtk = {
    enable = true;
    theme = { name = "Nordic-darker"; };
    iconTheme = { name = "Nordzy"; };
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
      extraConfig = { "gtk-cursor-theme-name" = "Breeze"; };
    };
  };
}
