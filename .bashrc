#
# ~/.bashrc
#
export EDITOR="nvim"

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

alias ls='eza --icons'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
