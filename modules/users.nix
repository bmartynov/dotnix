let extraGroups = [
  "sudo"
  "wheel"
  "networkmanager"
  "disk"
  "dbus"
  "audio"
  "docker"
  "sound"
  "pulse"
  "adbusers"
  "input"
  "libvirtd"
  "vboxusers"
  "wireshark"
  "lp"
  "scanner"
];
in
{
  boris = { pkgs, ... }: {
    users.users.boris = {
      uid = 1000;
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = extraGroups;
      description = "Martynov Boris";
      password = "boris"; # users.mutableUsers on by default
    };
  };

  alexandra = { pkgs, ... }: {
    users.users.alexandra = {
      uid = 1001;
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = extraGroups;
      description = "Martynova Alexandra";
      password = "alexandra"; # users.mutableUsers on by default
    };
  };
}
