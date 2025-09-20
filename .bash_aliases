# some more ls aliases
alias ll='ls -alF --color'
alias la='ls -A --color'
alias l='ls -CF --color'

# neovim
export SUDO_EDITOR="nvim"
alias 'sudoedit'='function _sudoedit() { sudo -e "$1"; }; _sudoedit'
