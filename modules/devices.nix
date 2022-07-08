{ pkgs, lib, config, ... }:
with lib;
with types; {
  options = { device = mkOption { type = str; }; };
}
