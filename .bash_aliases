# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# neovim
export SUDO_EDITOR="nvim"
alias 'sudoedit'='function _sudoedit() { sudo -e "$1"; }; _sudoedit'
