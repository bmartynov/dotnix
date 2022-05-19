{ config, lib, pkgs, ... }:
with lib;
let cfg = options.profiles;
in {
  options.profiles = with lib; {
    enable = mkEnableOption "profiles";

    hm = mkEnableOption "home manager";

    user = mkOption { type = types.str; };
  };

  config = mkIf cfg.enable {

  };
}
