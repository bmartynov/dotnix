switch-home:
	home-manager  --flake . switch

switch-system-borg:
	nixos-rebuild switch --use-remote-sudo --flake .#borg

switch-system-vulcan:
	nixos-rebuild switch --use-remote-sudo --flake .#vulcan

boot-system-borg:
	nixos-rebuild boot --use-remote-sudo --flake .#borg

boot-system-vulcan:
	nixos-rebuild boot --use-remote-sudo --flake .#vulcan

run-vm-borg:
	QEMU_OPTS=" -m=1024" nixos-rebuild build-vm --flake .#borg

nixfmt:
	find ./ -type f -name "*.nix" -exec nixfmt "{}" \;
