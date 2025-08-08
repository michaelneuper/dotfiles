# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1='\[\e[0;91m\][\[\e[0;93m\]\u\[\e[0;32m\]@\[\e[0;38;5;25m\]\h \[\e[0;38;5;250m\]\w\[\e[0;91m\]]\[\e[0m\]$ \[\e[0m\]'

# Stop using ugly java font
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
alias java='java "$_SILENT_JAVA_OPTIONS"'

# Fix global menu in GTK apps
if [ -n "$GTK_MODULES" ]; then
    GTK_MODULES="${GTK_MODULES}:appmenu-gtk-module" # unity-gtk-module
    #GTK_MODULES="${GTK_MODULES}:unity-gtk-module" # unity-gtk-module
else
    GTK_MODULES="appmenu-gtk-module"
    #GTK_MODULES="unity-gtk-module"
fi

if [ -z "$UBUNTU_MENUPROXY" ]; then
    UBUNTU_MENUPROXY=1
fi

# Aliases
if command -v bat >/dev/null 2>&1; then
    alias cat="bat --plain --theme=gruvbox-dark"
fi

if command -v zoxide >/dev/null 2>&1; then
    alias cd="z"
fi

if command -v lsd >/dev/null 2>&1; then
    alias ls="lsd -F"
    alias ll="lsd -Fl"
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

gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
