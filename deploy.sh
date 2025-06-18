#!/usr/bin/env bash
set -euo pipefail

echo "[1/3] Subindo VM via Terraform..."
cd terraform
terraform apply -auto-approve

echo "[2/3] Pegando IP da nova VM..."
IP=$(terraform output -raw vm_ip)

echo "[3/3] Instalando NixOS via nix-anywhere..."
cd ..
nix run github:nix-community/nix-anywhere -- --flake ./nix#vm-nix root@$IP
