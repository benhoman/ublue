#!/usr/bin/env sh

set ${SET_X:+-x} -eou pipefail

echo "Installing Twingate"

# Setup repo
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
