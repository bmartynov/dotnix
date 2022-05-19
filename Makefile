switch-home:
	home-manager  --flake . switch

switch-system-borg:
	nixos-rebuild switch --use-remote-sudo --flake .#borg

run-vm-borg:
	QEMU_OPTS=" -m=1024" nixos-rebuild build-vm --flake .#borg

nixfmt:
	find ./ -type f -name "*.nix" -exec nixfmt "{}" \;