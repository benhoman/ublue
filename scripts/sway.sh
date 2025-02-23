#!/usr/bin/env sh

set ${SET_X:+-x} -eou pipefail

echo "Installing Sway"

dnf5 install -y \
	sway \
	swaylock \
	swayidle \
	# launcher \
	rofi-wayland \
	bemenu \
	j4-dmenu-desktop \
	wofi \
	# screenshot \
	slurp \
	grim \
	# display \
	wlr-randr \
	wlsunset \
	brightnessctl \
	kanshi \
	# notifications \
	dunst \
	mako

