#!/usr/bin/env sh

# Thanks to bri for the inspiration! My script is mostly based on this example:
# https://github.com/briorg/bluefin/blob/c62c30a04d42fd959ea770722c6b51216b4ec45b/scripts/1password.sh

set ${SET_X:+-x} -eou pipefail

echo "Installing Twingate"

# On libostree systems, /opt is a symlink to /var/opt,
# which actually only exists on the live system. /var is
# a separate mutable, stateful FS that's overlaid onto
# the ostree rootfs. Therefore we need to install it into
# /usr/lib/1Password instead, and dynamically create a
# symbolic link /opt/1Password => /usr/lib/1Password upon
# boot.

# Prepare staging directory
mkdir -p /var/opt # -p just in case it exists
# for some reason...

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

cat <<EOF >/etc/yum.repos.d/packages.twingate.com_rpm_.repo
[packages.twingate.com_rpm_]
name=created by dnf config-manager from https://packages.twingate.com/rpm/
baseurl=https://packages.twingate.com/rpm/
enabled=1
gpgcheck=0
EOF

# Now let's install the packages.
dnf5 install -y twingate-latest

# Disable the yum repo (updates are baked into new images)
sed -i "s@enabled=1@enabled=0@" /etc/yum.repos.d/packages.twingate.com_rpm_.repo

