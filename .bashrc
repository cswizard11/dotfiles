#
# ~/.bashrc
#
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

export AWS_CONFIG_FILE="~/.config/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="~/.config/.aws/credentials"

export $(envsubst < ~/.env)

export PATH="$PATH:~/.cargo/bin"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

alias cat=bat
alias ls='eza --icons'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
