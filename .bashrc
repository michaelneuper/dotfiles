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
