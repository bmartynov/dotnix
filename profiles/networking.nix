{ pkgs, ... }: {
  services.resolved = { enable = true; };
  networking.networkmanager = {
    enable = true;
    wifi = { backend = "iwd"; };
    plugins = with pkgs; [
      networkmanager-openvpn
      gnome.networkmanager-openvpn
    ];
  };

  networking.firewall = { enable = true; };

  networking.wireless.iwd = {
    enable = true;
    settings = {
      General = {
        AddressRandomization = "once";
        AddressRandomizationRange = "nic";
        UseDefaultInterface = true;
      };
    };
  };
}
