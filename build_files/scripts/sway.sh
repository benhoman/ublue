#!/usr/bin/env sh

set ${SET_X:+-x} -eou pipefail

echo "Installing Sway"

dnf5 install -y \
	sway \
	swaylock \
	swayidle \
	rofi-wayland \
	xdg-desktop-portal \
	wl-clipboard \
	waybar \
	bemenu \
	j4-dmenu-desktop \
	wofi \
	slurp \
	grim \
	wlr-randr \
	wlsunset \
	brightnessctl \
	kanshi \
	dunst \
	mako
