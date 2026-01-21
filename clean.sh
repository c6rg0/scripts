#!/usr/bin/env bash
# Cleans old nixos generations

nix-collect-garbage --delete-old
sudo nix-collect-garbage -d

cd /etc/nixos/
sudo nix flake update
sudo nixos-rebuild switch --flake .#gabriel
