export ZSH="$HOME/.oh-my-zsh"
unset ZSH_THEME

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

zstyle ":omz:update" mode reminder # just remind me to update when it's time
zstyle ":omz:update" frequency 15

COMPLETION_WAITING_DOTS="true"

plugins=(starship zoxide git vi-mode colored-man-pages macos zsh-syntax-highlighting zsh-autosuggestions fzf)

source $ZSH/oh-my-zsh.sh

# USER CONFIGURATION
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

bindkey "^J" down-line-or-search # or down-line-or-history
bindkey "^K" up-line-or-search   # or up-line-or-history
bindkey "^B" backward-char
bindkey "^F" forward-char

HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=10000

# Env variables
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export LIBGS="/opt/homebrew/lib/libgs.dylib" # fix LaTeX rendering in emacs

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
--height 60%
--style full
--walker-skip .git,node_modules,target
--bind 'ctrl-/:change-preview-window(down|hidden|)'
--border sharp
--layout reverse
--prompt '∷ '
--pointer ▶
--marker ⇒
--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
--color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"

export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target
--preview 'bat -n --color=always --theme=gruvbox-dark {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Aliases
if command -v bat >/dev/null 2>&1; then
    alias cat="bat --plain --theme=gruvbox-dark"
fi

if command -v zoxide >/dev/null 2>&1; then
    alias cd="z"
fi

if command -v eza >/dev/null 2>&1; then
    alias ls="eza -F --icons=auto --no-quotes"
    alias ll="eza -F --long --no-user --icons=auto --no-quotes"
else
    alias ls="ls -GF"
    alias ll="ls -GFl"
fi

alias home="cd ~/"

alias e="nvim"
alias v="nvim"
alias vim="emacs -nw"

if command -v git-st >/dev/null 2>&1; then
    alias gs="git-st"
else
    alias gs="git status --short --branch"
fi

alias cs="gh copilot suggest"
alias ce="gh copilot explain"

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

alias bs="brew search"
alias bi="brew install"
alias bic="brew install --cask"
alias bu="brew update && brew upgrade"
