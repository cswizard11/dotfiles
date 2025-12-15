#!/bin/bash
# Generate configs from templates using gomplate

# Set theme (default to tokyo-night if not set)
THEME=${DOTFILES_THEME:-tokyo-night}
THEME_JSON=~/.config/themes/colors/${THEME}.json

# Generate all configs with gomplate
gomplate -d theme=${THEME_JSON} -f ~/.config/waybar/template.config.jsonc -o /tmp/waybar-config.jsonc
gomplate -d theme=${THEME_JSON} -f ~/.config/waybar/template.style.css -o /tmp/waybar-style.css
gomplate -d theme=${THEME_JSON} -f ~/.config/hypr/template.hyprlock.conf -o /tmp/hyprlock.conf
gomplate -d theme=${THEME_JSON} -f ~/.config/mako/template.config -o /tmp/mako-config

pkill waybar
waybar --config /tmp/waybar-config.jsonc --style /tmp/waybar-style.css &
pkill mako
mako --config /tmp/mako-config &
