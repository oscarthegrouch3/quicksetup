#!/usr/bin/env bash
set -e

echo "QuickSetup VM Provisioning"

# Ensure script is run with sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "[-] Please run this script with sudo: sudo ./bootstrap.sh"
  exit 1
fi

TARGET_USER="${SUDO_USER:-$USER}"
echo "[+] Target User: ${TARGET_USER}"

echo "[+] Step 1: Installing Ansible and essential bootstrap packages..."
apt-get update -y
apt-get install -y software-properties-common curl git python3-pip ansible

echo "[+] Step 2: Running Ansible playbook locally..."
ansible-playbook -i inventory.ini site.yml --connection=local

echo "VM QuickSetup complete"