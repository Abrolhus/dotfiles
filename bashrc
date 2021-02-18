case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignorespace
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000

#check winSize after each command, update it if necessary
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#Custom PS1
PROMPT_COMMAND='HPWD="$(echo $PWD | sed "s]^/home/$USER]~]" | grep -o "\/.\|^~\|^\/$" | paste -sd "" | sed -r "s]\/.?$]\/]" | xargs -I % echo %$(echo $PWD | grep -oE "[^\/]+$") | sed -r "s]$USER]""]")"'

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\: '

    # PS1='\[\033[01;34m\]$HPWD\[\033[00m\] '
    # PS1='\[\033[01;34m\]$HPWD\[\033[00m\]\[\033[38;5;6m\] ($(git branch 2>/dev/null | grep '^*' | colrm 1 2)) '
    PS1='\[\033[01;34m\]$HPWD\[\033[00m\] \[\033[38;5;6m\]$(__git_ps1 "(%s)")\[\033[00m\]: '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# colored commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
#colored errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#custom aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#bash completion
if ! shopt -oq posix; then
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
fi

#opencv workarround
export OpenCV_DIR=/home/abrolhus/Rinobot/Core/OpenCV-2.4.13/opencv/opencv-2.4.13/release/
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH
#fzf stuff
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#mpv
export PATH=$PATH:~/programs/frece-1.0.4-x86_64-unknown-linux-gnu
alias mpv='mpv --term-playing-msg="\${=filename}, \${=width}, \${=height}" --vo=null --ao=null --frames=1 --quiet --no-cache --no-config'


#on startup:
# [[ $TERM != "screen" ]] && exec tmux
