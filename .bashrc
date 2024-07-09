#
# ~/.bashrc
#
export EDITOR="nvim"

export AWS_CONFIG_FILE="~/.config/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="~/.config/.aws/credentials"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

alias cat=bat
alias ls='eza --icons'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
