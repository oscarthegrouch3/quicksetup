# QuickSetup Ansible VM Provisioning

Automated Ansible project to quickly set up a Linux VM (Ubuntu/Debian) with applications, developer tools, and terminal configurations.

### Option 1: One-Command Bootstrap (Recommended for new VMs)
Clone the repository to your VM and run the bootstrap script:
```bash
chmod +x bootstrap.sh
sudo ./bootstrap.sh
```
This automatically installs Ansible and provisions all tools and desktop applications locally.

---

### Option 2: Run via Ansible CLI

If Ansible is already installed:
```bash
# Provision local VM
sudo ansible-playbook -i inventory.ini site.yml --connection=local

# Provision a remote VM over SSH
ansible-playbook -i inventory.ini site.yml --ask-become-pass
```

---

## Included Applications & Tools

### Desktop Applications
- **Firefox** (`apt` / `firefox-esr`)
- **VS Code** (Official Microsoft APT repository)
- **Postman** (Official Snap package)
- **Ghostty** (Snap package with classic confinement)

### Developer Tools
- **Docker & Docker Compose** (Official Docker APT repository + `docker` user group addition)
- **Neovim** (`apt`)

### Shell & CLI Utilities
- **Zsh** (Set as default user shell)
- **CLI Tools**: `curl`, `wget`, `git`, `build-essential`, `htop`, `btop`, `jq`, `unzip`, `tree`, `ripgrep`, `fd-find`, `fzf`, `tmux`, `bat`

---

## Customization & Configuration

All options can be enabled or disabled in [`group_vars/all.yml`](file:///home/oscar/Development/QuickSetup/quicksetup/group_vars/all.yml):

```yaml
# Feature Toggles
install_desktop_apps: true
install_dev_tools: true
install_shell_tools: true

# Specific Tool Toggles
install_vscode: true
install_firefox: true
install_postman: true
install_ghostty: true
install_docker: true
install_neovim: true
install_zsh: true
```

---

## Project Structure

```
quicksetup/
├── ansible.cfg              # Ansible configuration
├── bootstrap.sh             # Self-installing bootstrap script for fresh VMs
├── inventory.ini            # Localhost & remote VM inventory
├── hosts.ini                # Alias inventory file
├── site.yml                 # Master Ansible playbook
├── app_setup.yml            # Legacy playbook entry point
├── group_vars/
│   └── all.yml              # Feature toggles and variable configuration
└── roles/
    ├── common/              # System updates & base packages
    ├── desktop_apps/        # Firefox, VS Code, Postman, Ghostty
    ├── dev_tools/           # Docker CE & Neovim
    └── shell_tools/         # Zsh, tmux & CLI tools
```