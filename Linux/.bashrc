# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto -h'
# eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias dirs="ls $LS_OPTIONS -al | grep '^d'"

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Disable Ctrl+Q shortcut in bash that unfreezes the output terminal, 
# so Ctrl+Q can be used in VIM for block selection
stty start undef

# DISABLE freezing terminal output 
# https://unix.stackexchange.com/questions/72086/ctrl-s-hangs-the-terminal-emulator
stty -ixon


# Set bash to used VI like 
set -o vi

alias h="history"

RebuildImageTmpl="(cd $PopDirectory && docker-compose down %s && docker rmi -f \$(docker-compose images %s --format json | jq -r '.[0].ID') && docker-compose up %s )" 
Image="asterisk-provider"
printf -v RemoteDockerImage "$RebuildImageTmpl" "$Image" "$Image" "$Image" 
alias doc-rebuild-asterisk-provider="$RemoteDockerImage"

Image="asterisk"
printf -v RemoteDockerImage "$RebuildImageTmpl" "$Image" "$Image" "$Image" 
alias doc-rebuild-asterisk="$RemoteDockerImage"

alias dcredis="(cd $PopDirectory \
    && docker-compose exec redis /bin/bash )"
alias dcmysql="(cd $PopDirectory && docker-compose exec mysql /bin/bash )"
alias dcast="(cd $PopDirectory && docker-compose exec asterisk /bin/bash )"
alias dcastp="(cd $PopDirectory && docker-compose exec asterisk-provider /bin/bash )"
alias dcu="(cd $PopDirectory && docker-compose up -d )"
alias dcd="(cd $PopDirectory && docker-compose down )"

alias dclap="(cd $PopDirectory &&  docker compose logs --follow asterisk-provider ) "
alias dcla="(cd $PopDirectory &&  docker compose logs --follow asterisk ) "

alias drp='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.State}}\t{{.CreatedAt}}"'


alias netr='systemctl restart networking.service'
alias nets='systemctl status networking.service'

alias ..="cd .."
alias ...="cd ../.."

alias ports='netstat -tulanp'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/tools/z.sh ] && source ~/tools/z.sh
# [ -f ~/tools/git-prompt.sh ] && source ~/tools/git-prompt.sh

alias f='vim "$(fzf)"'

alias fdc='clip "$(find . -type d -print | fzf)"'

alias lzd='/home/dawkor/homebrew/Cellar/lazydocker/0.21.1/bin/lazydocker'
