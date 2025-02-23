#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf install -y \
	bat exa fd-find fzf ripgrep thefuck tmux zellij zoxide \
	zsh fish \
	cascadia-code-fonts \
	gnome-keyring-pam \
	NetworkManager-tui

# Install Cosmic
dnf5 -y copr enable ryanabx/cosmic-epoch
dnf5 install -y cosmic-desktop
dnf5 -y copr disable ryanabx/cosmic-epoch

# Install Sway
/tmp/scripts/sway.sh

# Neovim Nightly
dnf5 -y copr enable agriffis/neovim-nightly 
dnf5 install -y neovim
dnf5 -y copr disable agriffis/neovim-nightly

#### Example for enabling a System Unit File

systemctl enable podman.socket

# Install 1password
/tmp/scripts/install-1password.sh

# Install twingate
/tmp/scripts/install-twingate.sh
