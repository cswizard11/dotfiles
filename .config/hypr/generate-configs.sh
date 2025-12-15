#!/bin/bash
# Generate configs from templates using envsubst

# Source theme colors
source ~/.config/themes/colors/${DOTFILES_THEME}.env

# Generate configs
envsubst < ~/.config/waybar/template.config.jsonc > /tmp/waybar-config.jsonc
envsubst < ~/.config/waybar/template.style.css > /tmp/waybar-style.css
envsubst < ~/.config/mako/template.config > /tmp/mako-config

# For hyprlock: use sed to replace only color variables, leaving hyprlock vars intact
sed -e "s|\${COLOR_BACKGROUND_ALT_RGBA}|${COLOR_BACKGROUND_ALT_RGBA}|g" \
    -e "s|\${COLOR_BLUE_RGBA}|${COLOR_BLUE_RGBA}|g" \
    -e "s|\${COLOR_FOREGROUND_RGBA}|${COLOR_FOREGROUND_RGBA}|g" \
    -e "s|\${COLOR_SUCCESS_RGBA}|${COLOR_SUCCESS_RGBA}|g" \
    -e "s|\${COLOR_CRITICAL_RGBA}|${COLOR_CRITICAL_RGBA}|g" \
    ~/.config/hypr/template.hyprlock.conf > /tmp/hyprlock.conf

pkill waybar
waybar --config /tmp/waybar-config.jsonc --style /tmp/waybar-style.css &
pkill mako
mako --config /tmp/mako-config &
