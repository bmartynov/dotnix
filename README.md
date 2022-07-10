# NixOS configuration
## build and run vm 
`
QEMU_OPTS=" -m=1024" nixos-rebuild build-vm --flake .
`
## build and switch system
`
nixos-rebuild switch --flake .
`
## build home-manager
`
nix build .#homeConfigurations.boris.activationPackage && ./result/activate
`

