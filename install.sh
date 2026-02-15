#!/usr/bin/env bash

REPO_DIR=$(pwd)

if [ ! -d "$REPO_DIR/system" ]; then
	echo "Error: start the script from repository folder!"
	exit 1
fi


echo "NixOS system configuration setup"


echo "remove current nix config..."
sudo rm -rf /etc/nixos/configuration.nix
sudo rm -rf /etc/nixos/modules


echo "add new nix config..."
sudo ln -sf "$REPO_DIR/system/configuration.nix" /etc/nixos/configuration.nix
sudo ln -sfn "$REPO_DIR/system/modules" /etc/nixos/modules


echo "Setup ~/.config/..."
mkdir -p ~/.config
for dir in "$REPO_DIR/dotfiles"/*/; do
	dir_name=$(basename "$dir")

	echo "Linking: $dir_name"

	rm -rf "$HOME/.config/$dir_name"
	ln -sfn "$dir" "$HOME/.config/$dir_name"
done


echo "Symlinks are done! NixOS Rebuild..."
if sudo nixos-rebuild switch; then
	echo "System updated successfully!"
else
	echo "Rebuild failed! Check the errors above."
	exit 1
fi

echo "Done."

