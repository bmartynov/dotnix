{ config, pkgs, ... }:

{
# undervolt 0 'CPU' -250
# undervolt 1 'GPU' -200
# undervolt 2 'CPU Cache' -50
# undervolt 3 'System Agent' 0
# undervolt 4 'Analog I/O' 0

  services.undervolt.enable = true;
  services.undervolt.coreOffset = -50;
}
