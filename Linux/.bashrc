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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
    PS1='(\[\e[2m\]\A\[\e[0m\])\[\e[38;5;34;1m\]\u\[\e[0m\]@\[\e[1m\]\h\[\e[0m\]:\[\e[38;5;117;1m\]\w\[\e[0m\]\$ '
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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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


# find $PWD will display full path 
# https://superuser.com/questions/527535/how-do-i-list-files-with-full-paths-in-linux


# Creating FZF Option like this to have better visibility
# string substitution
#   ${<name_of_variable>/<pattern>/<replacement_WTIHOUT_QOUTES>}
# e.g. 
# https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
# FOPTS=" --prompt 'All> ' "
# $FOPTS.=" --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# echo $FOPTS

# FD 
# https://github.com/sharkdp/fd
export FZF_DEFAULT_OPTS=$(cat <<-END
    --prompt 'All> ' 
    --preview "([[ -f {} ]] && (batcat --style=numbers,header,grid --color=always --line-range :500 {})) || ([[ -d {} ]] && (tree -C {})) || echo {} 2> /dev/null | head -200"
    --height 100%
    --layout=reverse
    --border=rounded
    --header 'C-D: Dirs / C-F: Files / C-Y: Yank Path / C-E: gVim'
    --bind 'ctrl-d:change-prompt(Directories> )+reload(fdfind -a -t d -H )'
    --bind 'ctrl-f:change-prompt(Files> )+reload(fdfind -a -t f -H)'
    --bind 'ctrl-y:execute-silent(path={}; winPath=\${path/\/mnt\/c/C\:}; clip.exe <<< \${winPath//\\//\\\\})+abort'
    --bind 'ctrl-e:execute-silent(path={}; winPath=\${path/\/mnt\/c/C\:}; gvim.exe --remote-tab-silent  \${winPath//\\//\\\\} &)+abort'
    --bind 'ctrl-f:execute(batcat {})+abort'
END
)

export FZF_DEFAULT_COMMAND="fdfind -a -E '(bin|obj)' "

alias f=' fzf '
alias fv='vim $( fzf )'
alias fe='cd $( fzf )'

# Disable Ctrl+Q shortcut in bash that unfreezes the output terminal,
# so Ctrl+Q can be used in VIM for block selection
stty start undef

# DISABLE freezing terminal output
# https://unix.stackexchange.com/questions/72086/ctrl-s-hangs-the-terminal-emulator
stty -ixon


# Set bash to used VI like
set -o vi

alias h="history"
alias bat="/usr/bin/batcat"

# source /mnt/c/mysettings/Linux/.bashrc

alias get='curl --location --remote-header-name --remote-name '

# GIT

alias multipull="find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;"


### =============================
# POWERLINE

if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source /usr/share/powerline/bindings/bash/powerline.sh
fi

################################


export INPUTRC="/mysettings/Linux/.inputrc"

export MYVIFMRC="/mysettings/Linux/vifmrc" 

## DOCKER
alias drps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.CreatedAt}}"'
alias drlazy='/home/dawkor/homebrew/Cellar/lazydocker/0.21.1/bin/lazydocker'

chmod +x /mysettings/Linux/docker-push.sh
alias dpub='/mysettings/Linux/docker-push.sh'


## PING
alias ping-web="ping google.com -c 1 -w 5 "
alias ping-web-ip="ping 1.1.1.1 -c 1 -w 5 "
alias ping-host="ping 192.168.255.1 -c 1 -w 5 "
alias ping-vpn="ping 192.168.13.181 -c 1 -w 5 "
alias ping-all=" ping-host && ping-vpn && ping-web "

## KUBERNETES
alias k9s='/home/linuxbrew/.linuxbrew/bin/k9s'
alias helm='/home/linuxbrew/.linuxbrew/bin/helm'
