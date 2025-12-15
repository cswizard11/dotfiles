#!/bin/bash
# Generate configs from templates using envsubst

# Source theme colors
source ~/.config/themes/colors/${DOTFILES_THEME}.env

# Generate configs
envsubst < ~/.config/waybar/template.config.jsonc > /tmp/waybar-config.jsonc
envsubst < ~/.config/waybar/template.style.css > /tmp/waybar-style.css
envsubst < ~/.config/mako/template.config > /tmp/mako-config

pkill waybar
waybar --config /tmp/waybar-config.jsonc --style /tmp/waybar-style.css &
pkill mako
mako --config /tmp/mako-config &
