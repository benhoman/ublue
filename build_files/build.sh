#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf install -y \
  bat exa fd-find ncdu ripgrep thefuck zoxide \
  unrar \
  NetworkManager-tui \
  ulauncher

# # Install Cosmic
# dnf5 -y copr enable ryanabx/cosmic-epoch
# dnf5 install -y cosmic-desktop
# dnf5 -y copr disable ryanabx/cosmic-epoch

# Install Sway
./scripts/sway.sh

# Neovim Nightly
dnf5 -y copr enable agriffis/neovim-nightly
dnf5 install -y neovim
dnf5 -y copr disable agriffis/neovim-nightly

# Zellij
dnf5 -y copr enable varlad/zellij
dnf5 install -y zellij
dnf5 -y copr disable varlad/zellij

#### Example for enabling a System Unit File

systemctl enable podman.socket

# Install 1password
./scripts/install-1password.sh

# Install twingate
./scripts/install-twingate.sh
