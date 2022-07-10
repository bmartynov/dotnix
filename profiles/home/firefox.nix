{ pkgs, ... }:

let
  userChrome = ''
    /* Hide main tabs toolbar */
    #TabsToolbar {
        visibility: collapse;
    }

    #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
      opacity: 0;
      pointer-events: none;
    }

    #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
        visibility: collapse !important;
    }

    /* Hide sidebar header, when using Tree Style Tab. */
    #sidebar-header {
        visibility: collapse;
    }

    #forward-button {
      display: none !important;
    }

    #home-button {
      display: none !important;
    }

    #reload-button {
      display: none;
    }'';
in {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles.default = {
      id = 0;
      userChrome = userChrome;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        "extensions.autoDisableScopes" = 0;

        "browser.search.defaultenginename" = "Google";
        "browser.search.selectedEngine" = "Google";
        "browser.urlbar.placeholderName" = "Google";
        "browser.search.region" = "US";

        "browser.uidensity" = 1;
        "browser.search.openintab" = true;
        "xpinstall.signatures.required" = false;
        "extensions.update.enabled" = false;

        "extensions.pocket.enabled" = false;
        "gfx.webrender.all" = true;
        "gfx.webrender.enabled" = true;
        "layers.acceleration.force-enabled" = true;
        "layers.force-active" = true;
        "widget.wayland-dmabuf-vaapi.enabled" = true;
        # "widget.content.allow-gtk-dark-theme" = false;
      };
    };

    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      sidebery
      keepassxc-browser
    ];
  };
}

# "font.name.monospace.x-western" = "IBM Plex Mono";
# "font.name.sans-serif.x-western" = "IBM Plex Sans";
# "font.name.serif.x-western" = "IBM Plex Serif";

# "browser.display.background_color" = thm.bg;
# "browser.display.foreground_color" = thm.fg;
# "browser.display.document_color_use" = 2;
# "browser.anchor_color" = thm.fg;
# "browser.visited_color" = thm.blue;
# "browser.display.use_document_fonts" = true;
# "pdfjs.disabled" = true;
# "media.videocontrols.picture-in-picture.enabled" = true;
