#!/usr/bin/env sh

set ${SET_X:+-x} -eou pipefail

echo "Installing 1Password"

# Setup repo
cat <<EOF >/etc/yum.repos.d/1password.repo
[1password]
name=1Password Stable Channel
baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://downloads.1password.com/linux/keys/1password.asc
EOF

# Import signing key
rpm --import https://downloads.1password.com/linux/keys/1password.asc

# Now let's install the packages.
dnf5 install -y 1password 1password-cli

# Disable the yum repo (updates are baked into new images)
sed -i "s@enabled=1@enabled=0@" /etc/yum.repos.d/1password.repo
