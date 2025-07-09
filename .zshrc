# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Cool themes: nicoulaj, refined, robbyrussell
# ZSH_THEME="refined"
unset ZSH_THEME

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode reminder # just remind me to update when it's time

zstyle ':omz:update' frequency 15

COMPLETION_WAITING_DOTS="true"

plugins=(starship git vi-mode colored-man-pages macos zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# USER CONFIGURATION
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=10000

# Env variables

# set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export LIBGS="/opt/homebrew/lib/libgs.dylib" # fix LaTeX rendering in emacs

# Aliases

if command -v bat >/dev/null 2>&1; then
    alias cat="bat --plain --theme=gruvbox-dark"
fi

alias v="vim"
alias vim="emacs -nw"

if command -v git-st >/dev/null 2>&1; then
    alias gs="git-st"
else
    alias gs="git status --short --branch"
fi

alias gst="git status"
alias ga="git add"
alias gb="git branch"
alias gbd="git branch -D"
alias gcb="git checkout -b"
alias gch="git checkout"
alias gc="git commit -m"
alias gp="git pull"
alias gpu="git push"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
