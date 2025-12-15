#!/bin/bash
# Generate configs from templates using envsubst

# Source theme colors
source ~/.config/themes/colors/${DOTFILES_THEME}.env

# Generate mako config
envsubst < ~/.config/mako/template.config > /tmp/mako-config