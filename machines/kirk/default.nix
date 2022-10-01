{ inputs, lib, ... }: {
  imports = [ inputs.self.profiles.nix ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  homebrew = {
    enable = true;
    autoUpdate = true;

    extraConfig = ''
      cask_args appdir: "~/Applications"
    '';

    # "zap" removes manually installed brews and casks
    cleanup = "zap";
    brews = [
      "qemu"
      "docker"

      "arm-linux-gnueabihf-binutils"
    ];

    casks = [
      "utm"

      "stats"
      "docker"
      "lens"

      "telegram"
      "slack"

      "keepassxc"

      "firefox"

      "google-chrome"
      "google-drive"

      "appcleaner"
      "visual-studio-code"
    ];
  };
}
